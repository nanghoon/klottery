package egovframework.example.sample.web.scheduler;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.example.sample.web.util.LottoApi;

@Component
public class Scheduler {
	
    @Resource(name = "sampleDAO")
    private SampleDAO sampleDAO;
    public static boolean setMega = false; 
    public static boolean setLotto = false; 
    public static boolean setPower = false; 
    
    @Scheduled(cron = "0 0/1 * * * *")
    public void checkLottoResultSet(){
    	if(setMega) LottoApi.setResultMegaPower(sampleDAO , 1);
    	if(setPower) LottoApi.setResultMegaPower(sampleDAO, 3);
    }
    
    // 30분 마다 main 데이터 셋팅 + 시세 가져오기 
    @Scheduled(cron = "0 0/10 * * * *")
    public void callLottoInfo(){
    	LottoApi.loadRate();
		LottoApi.setMainMegaData();
		LottoApi.setMainLottoData();
		LottoApi.setMainPowerData();
    }
        
}
