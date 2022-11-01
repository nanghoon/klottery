package egovframework.example.sample.web.util;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class AccessInterceptor extends HandlerInterceptorAdapter{
	List<String> urls;
	
	@Resource (name="sampleDAO")
	private SampleDAO sampleDAO;
	
	public void setUrls(List urls) {
		this.urls = urls;
	}
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	System.out.println("requestURI is " + request.getRequestURI());
    	HttpSession session = request.getSession();
    	String url = request.getRequestURI();
    	String[] urlArr = request.getRequestURI().split("/");
    	// 무시 하지 않아야 할 url들 
    	for(int i=0; i < urls.size(); i++){ // url이 무시해야될 url이면 (dispatcher-servlet에 썻던내용)
    		if(urls.get(i).equals(url)){
    			return true; // 바로 그 url로 이동 
    		}
    	}
    	session.setAttribute("curPage", null);
		// 관리자 인터셉터 
		if(urlArr[2].equals("admin")){// 관리자의 경우
			// 로그인 안되어있으면 로그인 페이지로 
			if(session.getAttribute("adminLogin") == null){ 
    			response.sendRedirect("/klottery/admin/login.do");
    			return false;
			}
		}else if(urlArr[2].equals("user")){
			if(session.getAttribute("userIdx") == null){ 
    			response.sendRedirect("/klottery/login.do");
    			return false;
			}
			EgovMap info = (EgovMap)sampleDAO.select("selectUserDetail",session.getAttribute("userIdx"));
			session.setAttribute("userName", info.get("name"));
			session.setAttribute("userId", info.get("id"));
			session.setAttribute("userPoint", info.get("point"));
			session.setAttribute("curPage", urlArr[3]);
		}else{
			session.setAttribute("curPage", urlArr[2]);
		}
		
		return true;
    }
    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }     
}
