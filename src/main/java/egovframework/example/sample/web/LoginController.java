package egovframework.example.sample.web;

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
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class LoginController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	// 회원가입
	@RequestMapping(value="/join.do")
	public String join(){
		return "user/join";
	}
	
	// 이메일 / 아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/dupleChk.do" , produces = "application/json; charset=utf8")
	public String dupleChk(HttpServletRequest request){
		String kind = request.getParameter("kind");
		String id = request.getParameter("id");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email3 = request.getParameter("email3");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(kind.equals("id")){
			if(Utils.isNull(id)){
				obj.put("msg", "아이디를 입력해주세요");
				return obj.toJSONString();
			}
			EgovMap info = (EgovMap)sampleDAO.select("checkDupleId",id);
			if(info != null){
				obj.put("result", "중복된 아이디입니다.");
				return obj.toJSONString();
			}
		}else{
			if(Utils.isNull(email1)){
				obj.put("msg", "이메일을 입력해주세요");
				return obj.toJSONString();
			}
			if(Utils.isNull(email2) || Utils.isNull(email3)){
				obj.put("msg", "이메일을 입력해주세요");
				return obj.toJSONString();
			}
			String email = email1+"@"+email3;
			if(Utils.isNull(email3)) email = email1+"@"+email2;
			EgovMap info = (EgovMap)sampleDAO.select("checkDupleEmail",email);
			if(info != null){
				obj.put("result", "중복된 이메일입니다.");
				return obj.toJSONString();
			}
		}
		
		obj.put("result", "suc");
		obj.put("msg", "사용가능합니다.");
		return obj.toJSONString();
	}
	
	// 문자보내기 
	@ResponseBody
	@RequestMapping(value="/auth.do" , produces ="application/json; charset=utf8")
	public String auth(HttpServletRequest request){
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(phone1) || Utils.isNull(phone2) || Utils.isNull(phone3)){
			obj.put("result", "연락처를 입력해주세요");
			return obj.toJSONString();
		}
		HttpSession session = request.getSession();
		session.setAttribute("code", 1);
		session.setAttribute("phone", phone1+phone2+phone3);
		obj.put("result", "suc");
		obj.put("msg", "인증번호를 입력해주세요");
		return obj.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/authChk.do" , produces ="application/json; charset=utf8")
	public String authChk(HttpServletRequest request){
		String phoneChk = request.getParameter("phoneChk");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(phoneChk)){
			obj.put("result", "인증번호를 입력해주세요");
			return obj.toJSONString();
		}
		if(!phoneChk.equals(""+session.getAttribute("code"))){
			obj.put("result", "인증번호가 일치하지않습니다");
			return obj.toJSONString();
		}
		obj.put("result", "suc");
		obj.put("msg", "인증완료되었습니다");
		session.setAttribute("code", null);
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/joinProcess.do" , produces = "application/json; charset=utf8")
	public String joinProcess(HttpServletRequest request){
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String yy = request.getParameter("year");
		String mm = request.getParameter("month");
		String dd = request.getParameter("day");
		String birth = yy+"-"+(mm.length() == 1 ? "0"+mm : mm)+"-"+(dd.length() == 1 ? "0"+dd : dd);
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email3 = request.getParameter("email3");
		String zip = request.getParameter("zip");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String sms = request.getParameter("sms");
		String mail = request.getParameter("mail");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(name)){
			obj.put("msg", "이름을 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(id)){
			obj.put("msg", "아이디를 입력하세요");
			return obj.toJSONString();
		}
		EgovMap info = (EgovMap)sampleDAO.select("checkDupleId",id);
		if(info != null){
			obj.put("result", "중복된 아이디입니다.");
			return obj.toJSONString();
		}
		if(Utils.isNull(pw)){
			obj.put("msg", "비밀번호를 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(pwChk)){
			obj.put("msg", "비밀번호확인을 입력하세요");
			return obj.toJSONString();
		}
		if(!pw.equals(pwChk)){
			obj.put("msg", "비밀번호와 비밀번호 확인값이 다릅니다");
			return obj.toJSONString();
		}
		if(Utils.getAmericanAge(birth) < 19){
			obj.put("msg", "만 19세미만은 가입이 불가능합니다");
			return obj.toJSONString();
		}
		if(Utils.isNull(phone1) || Utils.isNull(phone2) || Utils.isNull(phone3)){
			obj.put("msg", "연락처를 입력해주세요");
			return obj.toJSONString();
		}
		HttpSession session = request.getSession();
		if(!session.getAttribute("phone").equals(phone1+phone2+phone3)){
			obj.put("msg", "본인인증한 번호화 현재 입력된 연락처가 다릅니다");
			return obj.toJSONString();
		}
		if(Utils.isNull(email1)){
			obj.put("msg", "이메일을 입력해주세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(email2) || Utils.isNull(email3)){
			obj.put("msg", "이메일을 입력해주세요");
			return obj.toJSONString();
		}
		String email = email1+"@"+email3;
		if(Utils.isNull(email3)) email = email1+"@"+email2;
		info = (EgovMap)sampleDAO.select("checkDupleEmail",email);
		if(info != null){
			obj.put("result", "중복된 이메일입니다.");
			return obj.toJSONString();
		}
		session.setAttribute("phone", null);
		EgovMap in = new EgovMap();
		in.put("name", name);
		in.put("id", id);
		in.put("pw", pw);
		in.put("birth", birth);
		in.put("phone", phone1+"-"+phone2+"-"+phone3);
		in.put("email", email);
		in.put("zip", zip);
		in.put("add1", add1);
		in.put("add2", add2);
		in.put("sms", sms);
		in.put("mail", mail);
		sampleDAO.insert("insertMember",in);
		obj.put("result", "suc");
		obj.put("msg", "가입 완료되었습니다");
		return obj.toJSONString();
	}
	
	@RequestMapping(value="/login.do")
	public String login(HttpServletRequest request , Model model){
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("JSESSIONID")) continue;
				model.addAttribute(cookies[i].getName(), cookies[i].getValue());
			}
		}		
		return "user/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginProcess.do", produces = "application/json; charset=utf8")
	public String loginProcess(HttpServletRequest request , HttpServletResponse response){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String saveId = request.getParameter("saveId");
		HttpSession session = request.getSession();
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		if(Utils.isNull(id)){
			obj.put("msg", "아이디를 입력하세요");
			return obj.toJSONString();
		}
		if(Utils.isNull(pw)){
			obj.put("msg", "비밀번호를 입력하세요");
			return obj.toJSONString();
		}
		EgovMap in = new EgovMap();
		in.put("id", id);
		in.put("pw", pw);
		EgovMap info = (EgovMap)sampleDAO.select("checkLogin" , in);
		if(info == null){
			obj.put("msg", "아이디 혹은 비밀번호를 확인해주세요");
			return obj.toJSONString();
		}else{
			session.setAttribute("userIdx", info.get("idx"));
			session.setAttribute("userName", info.get("name"));
			session.setAttribute("userId", info.get("id"));
			session.setAttribute("userPoint", info.get("point"));
			if(!Utils.isNull(saveId)){
				Cookie cookie = new Cookie("cookieId" , id);
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(60*60*24*7); // 7일 
				response.addCookie(cookie);				
			}else{
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					for(int i=0; i<cookies.length; i++){
						if(cookies[i].getName().equals("cookieId")){
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
				}				
			}
			obj.put("result", "suc");
			obj.put("msg", "로그인 성공");
			return obj.toJSONString();
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("userIdx", null);
		session.setAttribute("userName", null);
		session.setAttribute("userId", null);
		session.setAttribute("userPoint", null);
		return"redirect:/main.do";
	}
	
}
