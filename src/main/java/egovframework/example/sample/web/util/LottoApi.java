package egovframework.example.sample.web.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
@RequestMapping("/lotto")
public class LottoApi {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;

	public static double rate;
	public static String mDate = "",pDate = ""; // 다음 추첨 날짜
	public static boolean mShow = true, lShow = true , pShow = true; // 당첨금 보여주기 여부 (true면 당첨금 / false면 추첨대기중)
	public static String mWon= "", lWon = "" , pWon = ""; // 현재 당첨금
	
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
		model.addAttribute("pDate", pDate);
		model.addAttribute("mWon", mWon);
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
			String nextDateTxt = ""+jobj.get("NextDrawingDate");
			Date nextDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(nextDateTxt);
			nextDate.setHours(nextDate.getHours()+13);
			mDate = new SimpleDateFormat("MM월 dd일 E요일 HH:mm").format(nextDate);
			JSONObject jackpot = (JSONObject) jobj.get("Jackpot");
			String hitMoney = new BigDecimal(""+jackpot.get("NextPrizePool")).toPlainString();
			String hitMoneyKr = new BigDecimal(hitMoney).multiply(new BigDecimal(rate)).toPlainString();
			mWon = new BigDecimal(hitMoneyKr).divide(new BigDecimal(100000000) ,0 , BigDecimal.ROUND_DOWN).toPlainString();
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
}
