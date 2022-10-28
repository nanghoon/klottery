package egovframework.example.sample.web.admin;

import java.io.File;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	@RequestMapping(value="/main.do")
	public String main(){
		return "admin/main";
	}
	
	@RequestMapping(value="/login.do")
	public String login(){
		return "admin/login";
	}
	@ResponseBody
	@RequestMapping(value = "/loginProcess.do", produces="application/json; charset=utf8")
	public String loginProcess(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(id == null || id.equals("")){
			obj.put("msg", "아이디를 입력하세요.");
			return obj.toJSONString();
		}
		if(pw == null || pw.equals("")){
			obj.put("msg", "비밀번호를 입력하세요.");
			return obj.toJSONString();
		}	
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		EgovMap info = (EgovMap)sampleDAO.select("checkAdminLogin", in);
		if(info == null){
			obj.put("msg", "아이디 혹은 비밀번호가 틀렸습니다.");
			return obj.toJSONString();
		}
			HttpSession session = request.getSession();
			session.setAttribute("adminLogin", "1");
			session.setAttribute("adminIdx", info.get("idx"));
			obj.put("result", "success");
			return obj.toJSONString();
		}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("adminLogin", null);
		session.setAttribute("adminIdx", null);
		return "admin/login";
	}
	
	@RequestMapping(value = "/editorFileUpload.do") // attach_photo.js 에 설정한 업로드 경로 
	public void editorFileUpload(MultipartHttpServletRequest mre,HttpServletRequest request, ModelMap model , HttpServletResponse response) throws Exception {
	    try {
	         String sFileInfo = "";
	         String filename = mre.getFile("file").getOriginalFilename();
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         filename_ext = filename_ext.toLowerCase();
	         String dftFilePath = fileProperties.getProperty("file.editor.upload");
	         String filePath = dftFilePath;  // 서버 업로드 경로 
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         realFileNm = UUID.randomUUID().toString().replaceAll("-", "") + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         MultipartFile mf = mre.getFile("file");
	         mf.transferTo(new File(rlFileNm));
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         sFileInfo += "&sFileName="+ realFileNm;;
	         sFileInfo += "&sFileURL=/filePath/klottery/editor/"+realFileNm; //에디터 이미지 나타낼 소스 경로
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

//	@ResponseBody
//	@RequestMapping(value="/alarm.do" , produces="application/json; charset=utf8")
//	public String alarm(HttpServletRequest request){
//		JSONObject obj = new JSONObject();
//		obj.put("qna", sampleDAO.select("checkQnaNoAnswer")); // 미답변 문의 
//		obj.put("cashD", sampleDAO.select("checkCash" , "0")); // 캐쉬 구매신청  
//		obj.put("cashW", sampleDAO.select("checkCash" , "1")); // 캐쉬 출금신청  
//		return obj.toJSONString();
//	}
}
