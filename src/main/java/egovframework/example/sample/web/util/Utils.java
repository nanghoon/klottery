package egovframework.example.sample.web.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import egovframework.example.sample.service.impl.SampleDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class Utils {
	public static boolean isNull(String str){
		return str == null || str.trim().isEmpty() || str.equals("null") || str.equals("NaN") || str.equals("undefined");
	}
	
	public static boolean isNum(String str){
		return Pattern.matches("^[0-9]*$", str);
	}
	public static boolean isEnOrNum(String str){
		return Pattern.matches("[a-zA-Z0-9]*$", str);
	}
	public static boolean isPwChk(String str){
		return Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&+=]).*$", str);
	}
	public static boolean isEnNum(String str){
		return Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).*$", str);
	}

	public static boolean isTextEngNum(String str) {
	    return Pattern.matches("^[가-힣a-zA-Z0-9]+$", str);
	}
	
	public static boolean isValidEmail(String email) { 
		 return Pattern.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$", email);
	}
	
	public static boolean isValidPhone(String str) {
	    return Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}$", str);
	}
	
	public static String getTempNumber(int length) {
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}
		return sb.toString();
	}
	
	public static String getTempCode(SampleDAO sampleDAO, int length) {
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}
		EgovMap codeInfo = (EgovMap)sampleDAO.select("checkInviteCode" ,sb.toString());
		if(codeInfo != null){
			getTempCode(sampleDAO,length);
		}
		return sb.toString();
	}
	public static int getAmericanAge(String birthDate) {
		LocalDate now = LocalDate.now();
		LocalDate parsedBirthDate = LocalDate.parse(birthDate, DateTimeFormatter.ISO_DATE);
		int americanAge = now.minusYears(parsedBirthDate.getYear()).getYear(); // (1)
		if (parsedBirthDate.plusYears(americanAge).isAfter(now)) { 
			americanAge = americanAge -1;
		}
	 
		return americanAge;    
	}
	public String getTempPassword(int length) {
		int index = 0;
		char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			index = (int) (charArr.length * Math.random());
			sb.append(charArr[index]);
		}
		return sb.toString();
	}
	
	public static String getDayOfWeek(){
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		String korDayOfWeek = "";
		switch (dayOfWeek) {
		    case 1:
		        korDayOfWeek = "일";
		        break;
		    case 2:
		        korDayOfWeek = "월";
		        break;
		    case 3:
		        korDayOfWeek = "화";
		        break;
		    case 4:
		        korDayOfWeek = "수";
		        break;
		    case 5:
		        korDayOfWeek = "목";
		        break;
		    case 6:
		        korDayOfWeek = "금";
		        break;
		    case 7:
		        korDayOfWeek = "토";
		        break;
		}
		return korDayOfWeek;
	}
	public static JSONArray readJsonArrFromUrl(String url) throws IOException, ParseException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = jsonReadAll(br);
			
			JSONParser p = new JSONParser();
			JSONArray arr = (JSONArray) p.parse(jsonText);
			return arr;
		} finally {
			is.close();
		}
	}
	
	private static String jsonReadAll(Reader reader) throws IOException {
		StringBuilder sb = new StringBuilder();

		int cp;
		while ((cp = reader.read()) != -1) {
			sb.append((char) cp);
		}

		return sb.toString();
	}

	public static void insertPointLog(SampleDAO sampleDAO, int midx, int kind, int point, String bank , String account) {
		EgovMap in = new EgovMap();
		in.put("midx", midx);
		in.put("kind", kind); //  0 입금 , 1 출금 , 2 로또구매 , 3 당첨금
		in.put("point", point);
		if(!Utils.isNull(bank)) in.put("bank", bank);
		if(!Utils.isNull(account)) in.put("account", account);
		sampleDAO.insert("insertPointLog" ,in);
	}
}
