package egovframework.example.sample.web.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	// 일반 유저 
	@RequestMapping("/userList.do")
	public String userList(HttpServletRequest request , Model model){
		String search = request.getParameter("search");
		PaginationInfo pi = new PaginationInfo();
		String pageIndex = request.getParameter("pageIndex");
		if(Utils.isNull(pageIndex)) pi.setCurrentPageNo(1);
		else pi.setCurrentPageNo(Integer.parseInt(pageIndex));
		pi.setPageSize(10);
		pi.setRecordCountPerPage(15);
		EgovMap in = new EgovMap();
		in.put("search", search);
		in.put("first", pi.getFirstRecordIndex());
		in.put("record", pi.getRecordCountPerPage());
		pi.setTotalRecordCount((int)sampleDAO.select("selectUserListCnt" , in));
		model.addAttribute("list",sampleDAO.list("selectUserList" , in));
		model.addAttribute("pi", pi);
		model.addAttribute("search",search);
		return "admin/userList";
	}
	@RequestMapping(value="/userDetail.do")
	public String userDetail(HttpServletRequest request , Model model){
		String idx = request.getParameter("idx");
		model.addAttribute("info", sampleDAO.select("selectUserDetail" , idx));
		return "admin/userDetail";
	}
}
