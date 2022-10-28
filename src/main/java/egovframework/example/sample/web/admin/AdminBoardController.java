package egovframework.example.sample.web.admin;

import java.io.File;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name = "fileProperties")
	private Properties fileProperties;

	// FAQ (자주묻는질문) ----------------
	@RequestMapping(value="/faqList")
	public String faqList(HttpServletRequest request , Model model){
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		if (Utils.isNull(request.getParameter("pageIndex"))) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(10);
		//인자생성
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		model.addAttribute("list", sampleDAO.list("selectFaqList", in));
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectFaqListCnt"));
		model.addAttribute("pi", paginationInfo);
		return "admin/faqList";
	}
	
	@RequestMapping(value="/faqWrite.do")
	public String faqWrite(){
		return "admin/faqWrite";
	}
	
	@ResponseBody
	@RequestMapping(value= "/faqInsert.do" , produces = "application/json; charset=utf8")
	public String faqInsert(HttpServletRequest request){
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String category = request.getParameter("category");
		JSONObject obj = new JSONObject();
		obj.put("result","fail");
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
		in.put("text", text);
		sampleDAO.insert("insertFaq" , in);
		obj.put("result","success");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/faqDetail.do")
	public String faqDetail(HttpServletRequest request , Model model){
		String idx = request.getParameter("idx");
		EgovMap info = (EgovMap)sampleDAO.select("selectFaqDetail" , idx);
		model.addAttribute("info", info);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(info.get("text").toString()));
		return "admin/faqDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/faqUpdate.do" , produces = "application/json; charset=utf8")
	public String faqUpdate(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String category = request.getParameter("category");
		JSONObject obj = new JSONObject();
		obj.put("result","fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력해주세요.");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		in.put("title", title);
		in.put("text", text);
		sampleDAO.update("updateFaq" , in);
		obj.put("result","success");
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/faqDelete.do" , produces = "application/json; charset=utf8")
	public String faqDelete(HttpServletRequest request){
		EgovMap in = new EgovMap();
		JSONObject obj = new JSONObject();
		String result = "success";
		//게시글 삭제처리 
		String delList = request.getParameter("delArray");
		String[] delArray = delList.split("-");
		if(delArray != null && delArray.length > 0){
			for(int i=0; i<delArray.length; i++){
				in.put("idx", delArray[i]);
				sampleDAO.update("deleteFaq" , in);
			}
			result = "success";
		}else{
			result = "nothing";
		}
		obj.put("result", result);
		return obj.toJSONString();
	}	
		
	// 1:1문의 (도움말) ---------------- 
	@RequestMapping(value="/qnaList.do")
	public String qnaList(HttpServletRequest request , Model model){
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		if (Utils.isNull(request.getParameter("pageIndex"))) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(10);
		//인자생성
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		model.addAttribute("list", sampleDAO.list("selectQnaListAll", in));
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectQnaListCntAll"));
		model.addAttribute("pi", paginationInfo);
		model.addAttribute("category" , request.getParameter("category"));
		return "admin/qnaList";
	}
	
	@RequestMapping(value="/qnaDetail.do")
	public String qnaDetail(HttpServletRequest request , Model model){
		String idx = request.getParameter("idx");
		EgovMap in = new EgovMap();
		in.put("idx", idx);
		EgovMap info = (EgovMap)sampleDAO.select("selectQnaDetail",in);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(info.get("text").toString()));
		if(info.get("answer") != null && !info.get("answer").equals("")){
			model.addAttribute("answer", StringEscapeUtils.unescapeHtml3(info.get("answer").toString()));
		}
		model.addAttribute("info",info);
		return "admin/qnaDetail";
	}
	@ResponseBody
	@RequestMapping(value="/qnaDelete.do" , produces = "application/json; charset=utf8")
	public String qnaDelete(HttpServletRequest request){
		EgovMap in = new EgovMap();
		JSONObject obj = new JSONObject();
		String result = "success";
		//게시글 삭제처리 
		String delList = request.getParameter("delArray");
		String[] delArray = delList.split("-");
		if(delArray != null && delArray.length > 0){
			for(int i=0; i<delArray.length; i++){
				in.put("idx", delArray[i]);
				sampleDAO.delete("deleteQna" , in);
			}
			result = "success";
		}else{
			result = "nothing";
		}
		obj.put("result", result);
		return obj.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value="/answer.do" , produces = "application/json; charset=utf8")
	public String answer(HttpServletRequest request){
		String idx = request.getParameter("idx");
		String answer = request.getParameter("answer");
		JSONObject obj = new JSONObject();
		obj.put("result","fail");
		if(Utils.isNull(answer)){
			obj.put("msg", "답변내용을 입력해주세요.");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("answer", answer);
		in.put("idx", idx);
		sampleDAO.update("updateAnswer" , in);
		obj.put("msg", "등록이 완료되었습니다.");
		obj.put("result","success");
		
		return obj.toJSONString();
	}
	
	// 이벤트 
	@RequestMapping(value="/eventList.do")
	public String eventList(HttpServletRequest request , Model model){
		//페이징
		PaginationInfo paginationInfo = new PaginationInfo();
		if (Utils.isNull(request.getParameter("pageIndex"))) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(10);
		//인자생성
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		model.addAttribute("list", sampleDAO.list("selectEventList", in));
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectEventListCnt"));
		model.addAttribute("pi", paginationInfo);
		return "admin/eventList";
	}
	@RequestMapping(value="/eventInsert.do")
	public String eventInsert(){
		return"admin/eventInsert";
	}
	@ResponseBody
	@RequestMapping(value= "/eventInsertProcess.do" , produces = "application/json; charset=utf8")
	public String eventInsertProcess(MultipartHttpServletRequest request){
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		MultipartFile img = request.getFile("file");
		JSONObject obj = new JSONObject();
		obj.put("result","fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력해주세요.");
			return obj.toJSONString();
		}
		if(img.isEmpty()){
			obj.put("msg", "이벤트 메인 사진을 등록해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(sdate)){
			obj.put("msg", "이벤트 시작날짜를 선택해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(edate)){
			obj.put("msg", "이벤트 종료날짜를 선택해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력해주세요.");
			return obj.toJSONString();
		}
		String path = fileProperties.getProperty("file.editor.upload");
		if(!new File(path).exists()){
			new File(path).mkdirs();
		}
		String filename = img.getOriginalFilename();
		String savedName = UUID.randomUUID().toString().replaceAll("-", "") + filename.substring(filename.lastIndexOf("."));
		EgovMap in = new EgovMap();
		try{
			img.transferTo(new File (path+savedName));
    		in.put("img", savedName);
		}catch(Exception e){
			e.printStackTrace();
			obj.put("msg", "사진 등록중 오류가 발생했습니다. \n새로고침 후 다시 시도해주세요.");
			return obj.toJSONString();
		}
		in.put("title", title);
		in.put("text", text);
		in.put("sdate", sdate);
		in.put("edate", edate);
		sampleDAO.insert("insertEvent" , in);
		obj.put("result","success");
		return obj.toJSONString();
	}
	@RequestMapping(value="/eventDetail.do")
	public String eventDetail(HttpServletRequest request , Model model){
		String idx = request.getParameter("idx");
		EgovMap info = (EgovMap)sampleDAO.select("selectEventDetail" , idx);
		model.addAttribute("info", info);
		model.addAttribute("text", StringEscapeUtils.unescapeHtml3(info.get("text").toString()));
		return "admin/eventDetail";
	}
	@ResponseBody
	@RequestMapping(value="/eventUpdate.do", produces = "application/json; charset=utf8")
	public String eventUpdate(MultipartHttpServletRequest request){
		String idx = request.getParameter("idx");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		MultipartFile img = request.getFile("file");
		JSONObject obj = new JSONObject();
		obj.put("result","fail");
		if(Utils.isNull(title)){
			obj.put("msg", "제목을 입력해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(sdate)){
			obj.put("msg", "이벤트 시작날짜를 선택해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(edate)){
			obj.put("msg", "이벤트 종료날짜를 선택해주세요.");
			return obj.toJSONString();
		}
		if(Utils.isNull(text)){
			obj.put("msg", "내용을 입력해주세요.");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		if(!img.isEmpty()){
			String path = fileProperties.getProperty("file.editor.upload");
			if(!new File(path).exists()){
				new File(path).mkdirs();
			}
			String filename = img.getOriginalFilename();
			String savedName = UUID.randomUUID().toString().replaceAll("-", "") + filename.substring(filename.lastIndexOf("."));
			try{
				img.transferTo(new File (path+savedName));
				in.put("img", savedName);
			}catch(Exception e){
				e.printStackTrace();
				obj.put("msg", "사진 등록중 오류가 발생했습니다. \n새로고침 후 다시 시도해주세요.");
				return obj.toJSONString();
			}
		}
		in.put("idx", idx);
		in.put("title", title);
		in.put("text", text);
		in.put("sdate", sdate);
		in.put("edate", edate);
		sampleDAO.insert("updateEvent" , in);
		obj.put("result","success");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/eventDelete.do" , produces = "application/json; charset=utf8")
	public String eventDelete(HttpServletRequest request){
		EgovMap in = new EgovMap();
		JSONObject obj = new JSONObject();
		String result = "success";
		//게시글 삭제처리 
		String delList = request.getParameter("delArray");
		String[] delArray = delList.split("-");
		if(delArray != null && delArray.length > 0){
			for(int i=0; i<delArray.length; i++){
				in.put("idx", delArray[i]);
				sampleDAO.update("deleteEvent" , in);
			}
			result = "success";
		}else{
			result = "nothing";
		}
		obj.put("result", result);
		return obj.toJSONString();
	}
}
