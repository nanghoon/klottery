package egovframework.example.sample.web.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.scheduler.Scheduler;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/lotto")
public class LottoApi {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	public static double rate;
	public static String mDate = "",pDate = ""; // 다음 추첨 날짜
	public static boolean mShow = true, lShow = true , pShow = true; // 당첨금 보여주기 여부 (true면 당첨금 / false면 추첨대기중)
	public static String mWon= "", lWon = "" , pWon = ""; // 현재 당첨금
	
	@RequestMapping(value="/setResultMega.do")
	public void setResultMegaUrl(){
		setResultMega(sampleDAO);
	}
	
	// 환율
	public static void loadRate(){
		System.out.println("loadRate==================================================================");
		try {
			JSONArray arr = Utils.readJsonArrFromUrl("https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRWUSD");
			if(arr != null){
				JSONObject obj = (JSONObject) arr.get(0);
				if(obj.get("basePrice") != null){
					Double bp = Double.parseDouble(""+obj.get("basePrice"));					
					rate = bp;
				}
			}
		} catch (Exception e) {
			System.out.println("loadRate Err :" + e);
		}
	}
	
	// 메인페이지 데이터 가져오기
	public static void getMainData(Model model){
		model.addAttribute("mDate", mDate);
		model.addAttribute("mShow", mShow);
		model.addAttribute("mWon", mWon);
		model.addAttribute("pDate", pDate);
		model.addAttribute("lWon", lWon);
		model.addAttribute("pWon", pWon);
	}
	
	// 메인페이지 데이터 셋팅
	public static void setMainMegaData(){
		System.out.println("setMegaData===============================================================");
		String url = "https://www.megamillions.com/cmspages/utilservice.asmx/GetLatestDrawData";
		Document doc = null;
		try {
			doc = Jsoup.connect(url)
					.header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
					.header("accept-encoding", "gzip, deflate, br")
					.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7")
					.userAgent( "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
					.ignoreContentType(true).get();
			JSONParser jpr = new JSONParser();
			JSONObject jobj = (JSONObject)jpr.parse(doc.text());
			
			// 다음회차 
			String nextDateTxt = ""+jobj.get("NextDrawingDate");
			Date nextDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(nextDateTxt);
			nextDate.setHours(nextDate.getHours()+13);
			mDate = new SimpleDateFormat("MM월 dd일 E요일 HH:mm").format(nextDate);
			
			// 추첨 대기중인지 
			JSONObject jackpot = (JSONObject) jobj.get("Jackpot");
			mShow = Boolean.parseBoolean(""+jackpot.get("Verified"));
			
			if(mShow){
				System.out.println("mshow ---- TRUE---------------------------------------");
				// 당첨금
				String hitMoney = new BigDecimal(""+jackpot.get("NextPrizePool")).toPlainString();
				String hitMoneyKr = new BigDecimal(hitMoney).multiply(new BigDecimal(rate)).toPlainString();
				mWon = new BigDecimal(hitMoneyKr).divide(new BigDecimal(100000000) ,0 , BigDecimal.ROUND_DOWN).toPlainString();
				if(Utils.getDayOfWeek().equals("수") || Utils.getDayOfWeek().equals("토")){
					System.out.println("수요일 혹은 토요일 -------------------------------------");
					Scheduler.setMega = true;
				}
				
			}
		} catch (Exception e) {
			System.out.println("setMainMegaData Err : "+ e);
		}
	}
	
	public static void setMainLottoData(){
		System.out.println("setMainLottoData===============================================================");
		String url = "https://dhlottery.co.kr/common.do?method=main";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
			lWon = doc.select("#winnerId dl dd strong").text().replace("억원", "");
		} catch (Exception e) {
			System.out.println("setMainLottoData Err : "+ e);
		}
	}
	
	public static void setMainPowerData(){
		System.out.println("setMainPowerData===============================================================");
		String url = "http://www.powerball.com/api/v1/estimates/powerball?_format=json";
		Document doc = null;
		try {
			doc = Jsoup.connect(url)
					.header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
					.header("accept-encoding", "gzip, deflate, br")
					.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7")
					.userAgent( "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
					.ignoreContentType(true).get();
			JSONParser jpr = new JSONParser();
			JSONArray arr = (JSONArray)jpr.parse(doc.text());
			JSONObject jobj = (JSONObject) arr.get(0);
			String nextDateTxt = ""+jobj.get("field_next_draw_date");
			Date nextDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(nextDateTxt);
			nextDate.setHours(nextDate.getHours()+9);
			pDate = new SimpleDateFormat("MM월 dd일 E요일 HH:mm").format(nextDate);
			String jackpot = jobj.get("field_prize_amount").toString().replace("$", "").replace(" Million", "");
			String hitMoney = new BigDecimal(jackpot).multiply(new BigDecimal(1000000)).toPlainString();
			String hitMoneyKr = new BigDecimal(hitMoney).multiply(new BigDecimal(rate)).toPlainString();
			pWon = new BigDecimal(hitMoneyKr).divide(new BigDecimal(100000000) ,0 , BigDecimal.ROUND_DOWN).toPlainString();
		} catch (Exception e) {
			System.out.println("setMainPowerData Err : "+ e);
		}		
	}
	
	// 최근 결과 셋팅
	public static void setResultMega(SampleDAO sampleDAO){
		System.out.println("setResultMega===============================================================");
		String url = "https://www.calottery.com/api/DrawGameApi/DrawGamePastDrawResults/15/1/20";
		Document doc = null;
		try {
			doc = Jsoup.connect(url)
					.header("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8")
					.header("accept-encoding", "gzip, deflate, br")
					.header("accept-language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7")
					.userAgent( "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
					.ignoreContentType(true).get();
			JSONParser jpr = new JSONParser();
			JSONObject jobj = (JSONObject)jpr.parse(doc.text());
			JSONObject recentData = (JSONObject) jobj.get("MostRecentDraw"); // 가장 최근 데이터 
			String cnt = ""+recentData.get("DrawNumber"); // 회차
			EgovMap in = new EgovMap();
			in.put("type", 1);
			in.put("cnt", cnt);
			System.out.println("타입과 회차 찾기 : " + in);
			EgovMap info = (EgovMap)sampleDAO.select("checkRecentLotto" , in);
			if(info == null){ // 해당 회차가 없을때만 실행 
				System.out.println("해당 회차 없음--------------------------");
				// 볼 번호 
				JSONObject ballObj = (JSONObject)recentData.get("WinningNumbers");
				for(int i=0; i<6; i++){
					JSONObject ball = (JSONObject)ballObj.get(""+i);
					if(i == 5) in.put("bnum", ball.get("Number"));
					else in.put("num"+(i+1), ball.get("Number"));
				}
				// 당첨금 
				JSONObject prize = (JSONObject)recentData.get("Prizes");
				JSONObject first = (JSONObject)prize.get("1");
				in.put("hit", first.get("Amount"));
				// 환율
				in.put("krate", rate);
				// 추첨일(현지)
				String date = ""+recentData.get("DrawDate");
				Date hitDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date);
				hitDate.setHours(hitDate.getHours()+13);
				in.put("rdate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(hitDate));
				// 추첨 영상
				//in.put("vurl", getMegaVideo());
				// 결과 0 이월 1 당첨
				in.put("result", first.get("Count").toString().equals("0") ? 0 : 1);
				// 1-9등 랭크 
				String data = "";
				data += "1,"+first.get("Amount")+","+first.get("Count");
				for(int i=2; i<10; i++){
					JSONObject rank = (JSONObject)prize.get(""+i);
					data +="|"+i+","+rank.get("Amount")+","+rank.get("Count");
				}
				in.put("data", data);
				System.out.println(in);
				sampleDAO.insert("insertLottoResult",in);
				Scheduler.setMega = false;
				
			}
		} catch (Exception e) {
			System.out.println("setResultMega Err : "+ e);
		}
	}
	
	private static String getMegaVideo(){
		System.out.println("getMegaVideo===============================================================");
		String url = "https://www.youtube.com/user/megamillions46/videos";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
			System.out.println(doc);
			System.out.println(doc.select("contents"));
		} catch (Exception e) {
			System.out.println("getMegaVideo Err : "+ e);
		}
		return "";
	}
}
