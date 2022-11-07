package egovframework.example.sample.web.admin;

import java.io.File;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/admin/lotto")
public class AdminLottoController {
	@Resource(name = "sampleDAO")
	private SampleDAO sampleDAO;
	
	@Resource(name = "fileProperties")
	private Properties fileProperties;
	
	@RequestMapping(value="/buyLotto.do")
	public String buyLotto(HttpServletRequest request ,Model model, HttpServletResponse response) throws Exception{
		String type = request.getParameter("type");
		String search = request.getParameter("search");
		String order = request.getParameter("order");
		PaginationInfo paginationInfo = new PaginationInfo();
		if (Utils.isNull(request.getParameter("pageIndex"))) {
			paginationInfo.setCurrentPageNo(1);
		} else {
			paginationInfo.setCurrentPageNo(Integer.parseInt("" + request.getParameter("pageIndex")));
		}
		paginationInfo.setRecordCountPerPage(15);
		paginationInfo.setPageSize(10);
		EgovMap in = new EgovMap();
		in.put("first", paginationInfo.getFirstRecordIndex());
		in.put("record", paginationInfo.getRecordCountPerPage());
		in.put("type", type);
		in.put("search", search);
		in.put("order", order);
		paginationInfo.setTotalRecordCount((int)sampleDAO.select("selectBuyLottoListCnt" , in));
		List<EgovMap> list = (List<EgovMap>)sampleDAO.list("selectBuyLottoList",in);
//		for(int i=0; i<list.size(); i++){
//			BigInteger hitMoney = BigInteger.ZERO;
//			List<EgovMap> hitlist = null;
//			EgovMap hitPrize = null;
//			if(list.get(i).get("wb").toString().contains("-1") || list.get(i).get("mb").toString().contains("-1")){
//				list.get(i).put("qp", "1");
//			}
//			if(Integer.parseInt(""+list.get(i).get("hit")) > 0 && Integer.parseInt(""+list.get(i).get("approval")) != 0){
//				in.put("cnt", list.get(i).get("episode"));
//				in.put("gid", list.get(i).get("gid"));
//				hitlist = (List<EgovMap>)sampleDAO.list("selectLottoHitListByEpisode",in);
//				hitPrize = (EgovMap)sampleDAO.select("selectLottoPrizes" , list.get(i).get("ridx"));
//				for(int j=0; j<hitlist.size(); j++){
//					list.get(i).put("give", hitlist.get(j).get("approval"));
//					int multi = Integer.parseInt(""+list.get(i).get("rmulti"));
//					BigInteger hm = Lotto.setHitMoney(hitPrize.get("data")+"" , Integer.parseInt(""+hitlist.get(j).get("lottery")));
//					if(type.equals("2") && Integer.parseInt(""+hitlist.get(j).get("lottery")) == 2) multi = 2; // 파워볼 2등은 배수와 상관없이 무조건 2배임 
//					if(Integer.parseInt(""+list.get(i).get("boption")) == 1 && Integer.parseInt(""+hitlist.get(j).get("lottery")) != 1){
//						hm = hm.multiply(BigInteger.valueOf(multi));
//					}
//					hitMoney = hitMoney.add(hm);
//				}
//			}else{
//				list.get(i).put("give", 0);
//			}
//			list.get(i).put("hitMoney", hitMoney);
//		}
		model.addAttribute("list", list);
		model.addAttribute("pi", paginationInfo);
		model.addAttribute("type", type);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		return "admin/buyLotto";
	}
	
	@RequestMapping("/buyLottoDetail.do")
	public String buyLottoDetail(HttpServletRequest request, Model model){
		//String tidx = request.getParameter("tidx");
		//String deliver = request.getParameter("deliver");
		String type = request.getParameter("type");
		String cnt = request.getParameter("cnt");
		String midx = request.getParameter("midx");
		String gid = request.getParameter("gid");
		EgovMap in = new EgovMap();
		in.put("cnt", cnt);
		in.put("midx", midx);
		in.put("gid", gid);
		in.put("type", type);
		List<EgovMap> list = (List<EgovMap>)sampleDAO.list("selectBuyLottoDetailList" , in);
//		BigInteger hitMoney = BigInteger.ZERO;
//		for(int i=0; i<list.size(); i++){
//			EgovMap hitPrize = null;
//			if(Integer.parseInt(""+list.get(i).get("lottery")) > 0){
//				hitPrize = (EgovMap)sampleDAO.select("selectLottoPrizes" , list.get(i).get("ridx"));
//				int multi = Integer.parseInt(""+list.get(i).get("rmulti"));
//				BigInteger hm = Lotto.setHitMoney(hitPrize.get("data")+"" , Integer.parseInt(""+list.get(i).get("lottery")));
//				if(type.equals("2") && Integer.parseInt(""+list.get(i).get("lottery")) == 2) multi = 2; // 파워볼 2등은 배수와 상관없이 무조건 2배임
//				if(Integer.parseInt(""+list.get(i).get("boption")) == 1 && Integer.parseInt(""+list.get(i).get("lottery")) != 1){
//					hm = hm.multiply(BigInteger.valueOf(multi));
//				}
//				hitMoney = hitMoney.add(hm);
//			}
//		}
//		model.addAttribute("hitMoney", hitMoney);
		model.addAttribute("infoList", list);
		model.addAttribute("type", type);
//		model.addAttribute("tidx", tidx);
//		model.addAttribute("deliver", deliver);
		return"admin/buyLottoDetail";
	}

	// 공통 로또 스캔 업로드 
	@ResponseBody
	@RequestMapping(value= "/lottoScan.do" , produces = "application/json; charset=utf8")
	public String lottoScan(MultipartHttpServletRequest request){
		String cnt = request.getParameter("cnt");
		String midx = request.getParameter("midx");
		String gid = request.getParameter("gid");
		String type = request.getParameter("type");
		MultipartFile file = request.getFile("file");
		JSONObject obj = new JSONObject();
		obj.put("result", "fail");
		EgovMap in = new EgovMap();
		String filePath = fileProperties.getProperty("file.photo.upload");
        File fileP = new File(filePath);
        if(!fileP.exists()) {
        	fileP.mkdirs();
        }
        if(file.isEmpty()){
        	obj.put("msg", "파일을 등록해주세요");
        	return obj.toJSONString();
        }
        String originNm = file.getOriginalFilename();
		String saveNm = UUID.randomUUID().toString().replaceAll("-", "") + originNm.substring(originNm.lastIndexOf("."));
		try {
			file.transferTo(new File(filePath+saveNm));
			in = new EgovMap();
			in.put("img", saveNm);
			in.put("type", type);
			in.put("midx", midx);
			in.put("cnt", cnt);
			in.put("gid", gid);
			sampleDAO.update("updateLottoScan" , in);
			obj.put("msg","파일 등록이 완료되었습니다");
			obj.put("result","success");
			return obj.toJSONString();
		} catch (Exception e) {
			obj.put("msg","파일 등록 중 오류가 발생했습니다 \n다시 시도해 주세요");
			return obj.toJSONString();
		}
	}
	

}
