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
import egovframework.example.sample.web.util.LottoApi;
import egovframework.example.sample.web.util.Utils;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/user")
public class MainController {

	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@RequestMapping(value="/main.do")
	public String main(Model model){
		LottoApi.getMainData(model);
		model.addAttribute("mega", sampleDAO.select("selectMostRecentLottoByType" ,1));
		model.addAttribute("power", sampleDAO.select("selectMostRecentLottoByType" ,3));
		return "user/main";
	}
}
