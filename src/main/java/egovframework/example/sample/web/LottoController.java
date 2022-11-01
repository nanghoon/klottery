package egovframework.example.sample.web;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.LottoApi;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/user")
public class LottoController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/buyMega.do")
	public String buyMega(Model model){
		LottoApi.getMainData(model);
		return "user/buyMega";
	}
	
	// 나의 로또볼 저장하기 
	@ResponseBody
	@RequestMapping(value="/saveMyLottoBall.do" , produces="application/json; charset=utf8")
	public String saveMyLottoBall(HttpServletRequest request){
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String[] numlist = request.getParameterValues("numlist");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap in = new EgovMap();
		in.put("type", type); // 메가밀리언 1 동행복권2 파워볼3
		in.put("midx", session.getAttribute("userIdx"));
		for(int i=0; i<numlist.length; i++){
			String[] numArr = numlist[i].split(",");
			for(int j=0; j<numArr.length; j++){
				in.put("num"+(j+1), numArr[j]);
				if(j == numArr.length-1){
					if(type.equals("2"))in.put("num"+(j+1), numArr[j]);
					else in.put("bnum", numArr[j]);
				}
			}
			sampleDAO.insert("insertMyLotto",in);
		}
		obj.put("result", "success");
		obj.put("msg", "저장 완료되었습니다.");
		return obj.toJSONString();
	}	

	// 나의 로또볼 가져오기
	@ResponseBody
	@RequestMapping(value="/getMyLottoBall.do" , produces = "application/json; charset=utf8")
	public String getMyLottoBall(HttpServletRequest request){
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		JSONObject obj = new JSONObject();
		EgovMap in = new EgovMap();
		in.put("type", type); // 메가밀리언 1 동행복권2 파워볼3
		in.put("midx", session.getAttribute("userIdx"));
		obj.put("data", sampleDAO.list("selectMyLottoBallList",in));
		return obj.toJSONString();
	}
	// 나의 로또볼 가져오기 (하나만)
	@ResponseBody
	@RequestMapping(value="/getMyLottoBallDetail.do" , produces = "application/json; charset=utf8")
	public String getMyLottoBallDetail(HttpServletRequest request){
		String idx = request.getParameter("idx");
		JSONObject obj = new JSONObject();
		obj.put("data", sampleDAO.select("selectMyLottoBallDetail",idx));
		return obj.toJSONString();
	}
	// 나의 로또볼 삭제하기
	@ResponseBody
	@RequestMapping(value="/delMyLottoBall.do" , produces = "application/json; charset=utf8")
	public String delMyLottoBall(HttpServletRequest request){
		HttpSession session = request.getSession();
		String idx = request.getParameter("idx");
		String type = request.getParameter("type");
		JSONObject obj = new JSONObject();
		sampleDAO.delete("deleteMyLottoBall",idx);
		EgovMap in = new EgovMap();
		in.put("type", type); // 메가밀리언 1 동행복권2 파워볼3
		in.put("midx", session.getAttribute("userIdx"));
		obj.put("data", sampleDAO.list("selectMyLottoBallList",in));
		return obj.toJSONString();
	}
	
	// 로또 구매 로직
	@ResponseBody
	@RequestMapping(value="/buyLottoProcess.do" , produces = "application/json; charset=utf8")
	public String buyLottoProcess(HttpServletRequest request){
		HttpSession session = request.getSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String type = request.getParameter("type"); // 1 메가 2 동행 3 파워
		String[] numlist = request.getParameterValues("numlist");
		String selectGame = request.getParameter("selectGame"); // 선택한 게임 수
		String gameType = request.getParameter("gameType"); // 0 수동 1 자동 2 나의 로또볼
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap info = (EgovMap)sampleDAO.select("selectUserDetail",session.getAttribute("userIdx"));
		int point = Integer.parseInt(""+info.get("point"));
		int price = Integer.parseInt(""+selectGame)*5000;
		if(point < price){
			obj.put("msg", "포인트가 부족합니다");
			return obj.toJSONString();
		}
		EgovMap lotto = (EgovMap)sampleDAO.select("selectMostRecentLottoByType" , type);
		int cnt = Integer.parseInt(""+lotto.get("cnt"))+1; // 구매할 회차 : 직전회차 + 1 
		String rdateTxt = ""+lotto.get("rdate"); // 당첨 현지 시간
		try {
			if(type.equals("1")){
				// 메가밀리언 당첨 회차 : 수 ,토 
				if(Utils.getDayOfWeek().equals("수") || Utils.getDayOfWeek().equals("토")){
					// 오늘자 결과가 안나온 상태라면 구매할 회차에 1을 더 더해줘야함
					Date rdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rdateTxt);
					rdate.setHours(rdate.getHours()+16);
					String kdate = sdf.format(rdate);
					if(!kdate.equals(sdf.format(date))){ // 오늘과 우리나라 당첨 시간이 아니라면 
						cnt += 1;
					}
				}
			}else if(type.equals("2")){
				if(Utils.getDayOfWeek().equals("토")){
					if(!sdf.format(rdateTxt).equals(sdf.format(date))){
						cnt += 1;
					}
				}
			}else if(type.equals("3")){
				// 파워볼 당첨 회차 : 화 , 목 , 일 
				if(Utils.getDayOfWeek().equals("화") || Utils.getDayOfWeek().equals("목") || Utils.getDayOfWeek().equals("일")){
					// 오늘자 결과가 안나온 상태라면 구매할 회차에 1을 더 더해줘야함
					Date rdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rdateTxt);
					rdate.setHours(rdate.getHours()+16);
					String kdate = sdf.format(rdate);
					if(!kdate.equals(sdf.format(date))){ // 오늘과 우리나라 당첨 시간이 아니라면 
						cnt += 1;
					}
				}
			}
			EgovMap in = new EgovMap();
			// 금액 차감 
			in.put("idx", session.getAttribute("userIdx"));
			in.put("point", "-"+price);
			sampleDAO.update("updateUserPoint",in);
			
			// 금액 로그
			Utils.insertPointLog(sampleDAO , Integer.parseInt(""+session.getAttribute("userIdx")) , 2 , price , null , null);
			
			// 로또 구매
			in.put("midx", session.getAttribute("userIdx"));
			in.put("type", type);
			in.put("cnt", cnt);
			in.put("kind", gameType);
			in.put("gtype", selectGame);
			in.put("num", "");
			obj.put("msg", "구매 완료되었습니다");
			return obj.toJSONString();
		} catch (Exception e) {
			System.out.println("buyLottoProcess Err ------ " + e);
			obj.put("msg", "오류가 발생했습니다 다시 시도해주세요");
			return obj.toJSONString();
		}
	}
}
