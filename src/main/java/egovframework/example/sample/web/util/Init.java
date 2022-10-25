package egovframework.example.sample.web.util;

public class Init{
    public void init()  {
    	LottoApi.loadRate();
		LottoApi.setMainMegaData();
		LottoApi.setMainLottoData();
		LottoApi.setMainPowerData();
    }	
}