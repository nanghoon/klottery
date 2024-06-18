package egovframework.example.sample.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class MainController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/main.do")
	public String main(Model model){
		LottoApi.getMainData(model);
		model.addAttribute("mega", sampleDAO.select("selectMostRecentLottoByType" ,1));
		model.addAttribute("lotto", sampleDAO.select("selectMostRecentLottoByType" ,2));
		model.addAttribute("power", sampleDAO.select("selectMostRecentLottoByType" ,3));
		return "user/main";
	}
	
	// 당첨결과
	@RequestMapping(value="/result.do")
	public String result(HttpServletRequest request , Model model){
		String pageIndex = request.getParameter("pageIndex");
		String type = request.getParameter("type"); // 1메가밀리언 2 동행복권 3파워볼
		PaginationInfo pi = new PaginationInfo();
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		pi.setPageSize(5);
		pi.setRecordCountPerPage(10);
		
		EgovMap in = new EgovMap();
		in.put("first",pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("type", type);
		
		pi.setTotalRecordCount((int)sampleDAO.select("selectLottoListCnt" , in));
		model.addAttribute("list", sampleDAO.list("selectLottoList",in));
		model.addAttribute("pi", pi);
		model.addAttribute("type", type);
		return "user/result";
	}
	
	// 당첨 결과 상세 
	@ResponseBody
	@RequestMapping(value="/resultDetail.do" , produces="application/json; charset=utf8")
	public String resultDetail(HttpServletRequest request){
		String idx = request.getParameter("idx");
		JSONObject obj = new JSONObject();
		EgovMap info = (EgovMap)sampleDAO.select("selectLottoDetail",idx);
		try {
			info.put("rdate", new SimpleDateFormat("MM월 dd일 E요일 HH:mm").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(""+info.get("rdate"))));
		} catch (Exception e) {
			System.out.println("resultDetail Err : "+ e);
		}
		obj.put("info", info);
		return obj.toJSONString();
	}
	
	// 복권소개
	@RequestMapping(value="/intro.do")
	public String intro(){
		return "user/intro";
	}
	// 당첨가이드
	@RequestMapping(value="/hitGuide.do")
	public String hitGuide(){
		return "user/hitGuide";
	}
	// 구매가이드
	@RequestMapping(value="/buyGuide.do")
	public String buyGuide(){
		return "user/buyGuide";
	}
	// 마이페이지 
	@RequestMapping(value="/mypage.do")
	public String mypage(){
		return "user/mypage";
	}
	@RequestMapping(value="/buyhit.do")
	public String buyhit(){
		return "user/buyhit";
	}
	@RequestMapping(value="/point.do")
	public String point(){
		return "user/point";
	}
	@RequestMapping(value="/pointIn.do")
	public String pointIn(){
		return "user/pointIn";
	}
	@RequestMapping(value="/pointOut.do")
	public String pointOut(){
		return "user/pointOut";
	}
	@RequestMapping(value="/myinfo.do")
	public String myinfo(){
		return "user/myinfo";
	}
	@RequestMapping(value="/delete.do")
	public String delete(){
		return "user/delete";
	}
	
	// 회사소개 
	@RequestMapping(value="/company.do")
	public String company(){
		return "user/company";
	}
	@RequestMapping(value="/terms.do")
	public String terms(){
		return "user/terms";
	}
	@RequestMapping(value="/privacy.do")
	public String privacy(){
		return "user/privacy";
	}
}
