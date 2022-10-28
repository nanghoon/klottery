package egovframework.example.sample.web;


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
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	@RequestMapping(value="/faqList.do")
	public String faqList(HttpServletRequest request , Model model){
		String search = request.getParameter("search");
		PaginationInfo paginationInfo = new PaginationInfo();
		if (Utils.isNull(request.getParameter("pageIndex"))) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(5);	
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		in.put("search", search);
		List<EgovMap> list =(List<EgovMap>)sampleDAO.list("selectFaqList",in);
		for(int i=0; i<list.size(); i++){
			list.get(i).put("text", StringEscapeUtils.unescapeHtml3(list.get(i).get("text").toString()));
		}
		model.addAttribute("list",list);
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectFaqListCnt",in));
		model.addAttribute("pi", paginationInfo);
		model.addAttribute("search",search);
		return "user/faqList";
	}
	
	@RequestMapping("/user/qnaInsert.do")
	public String qnaInsert(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		String idx = session.getAttribute("userIdx").toString();
		EgovMap info = (EgovMap)sampleDAO.select("selectUserDetail",idx);
		model.addAttribute("info",info);
		return"user/qnaInsert";
	}
	@ResponseBody
	@RequestMapping(value="/user/qnaInsertProcess.do" , produces="application/json; charset=utf8")
	public String qnaInsertProcess(HttpServletRequest request){
		HttpSession session = request.getSession();
		String title =request.getParameter("title");
		String text =request.getParameter("text");
		String category =request.getParameter("category");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(category)){
			obj.put("msg" , "문의유형을 선택해주세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력해주세요.");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("title", title);
		in.put("category", category);
		in.put("text", text);
		in.put("qidx", session.getAttribute("userIdx"));
		sampleDAO.insert("insertQna",in);
		obj.put("result", "success");
		obj.put("msg", "문의등록이 완료되었습니다.");
		return obj.toJSONString();
	}
	@RequestMapping(value="/user/qnaList.do")
	public String qnaList(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		PaginationInfo pi = new PaginationInfo();
		String pageIndex = request.getParameter("pageIndex");
		if(Utils.isNull(pageIndex)){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		}
		pi.setPageSize(5);
		pi.setRecordCountPerPage(15);
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("idx", session.getAttribute("userIdx"));
		List<EgovMap> qnaList = (List<EgovMap>)sampleDAO.list("selectQnaUserList",in);
		for(int i=0; i<qnaList.size(); i++){
			qnaList.get(i).put("text", StringEscapeUtils.unescapeHtml3(qnaList.get(i).get("text").toString()));
		}
		pi.setTotalRecordCount((int)sampleDAO.select("selectQnaUserListCnt" , in));
		model.addAttribute("list",qnaList);
		model.addAttribute("pi",pi);
		return"user/qnaList";
	}
	@RequestMapping(value="/user/qnaDetail.do")
	public String qnaDetail(HttpServletRequest request, Model model){
		String idx = request.getParameter("idx");
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail",in);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(info.get("text").toString()));
		if(info.get("answer") != null && !info.get("answer").equals("")){
			model.addAttribute("answer", StringEscapeUtils.unescapeHtml3(info.get("answer").toString()));
		}
		model.addAttribute("info",info);
		return"user/qnaDetail";
	}

	@RequestMapping(value="/eventList.do")
	public String eventList(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		PaginationInfo pi = new PaginationInfo();
		String pageIndex = request.getParameter("pageIndex");
		if(Utils.isNull(pageIndex)){
			pi.setCurrentPageNo(1);
		}else{
			pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		}
		pi.setPageSize(5);
		pi.setRecordCountPerPage(15);
		EgovMap in = new EgovMap();
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		in.put("idx", session.getAttribute("userIdx"));
		List<EgovMap> eventList = (List<EgovMap>)sampleDAO.list("selectEventList",in);
		for(int i=0; i<eventList.size(); i++){
			eventList.get(i).put("text", StringEscapeUtils.unescapeHtml3(eventList.get(i).get("text").toString()));
		}
		pi.setTotalRecordCount((int)sampleDAO.select("selectEventListCnt" , in));
		model.addAttribute("eventList",eventList);
		model.addAttribute("pi",pi);
		return"user/eventList";
	}
	@RequestMapping(value="/eventDetail.do")
	public String eventDetail(HttpServletRequest request, Model model){
		String idx = request.getParameter("idx");
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		EgovMap info = (EgovMap)sampleDAO.select("selectEventDetail",in);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(info.get("text").toString()));
		model.addAttribute("info",info);
		return"user/eventDetail";
	}
}
