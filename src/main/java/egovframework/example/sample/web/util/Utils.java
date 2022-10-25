package egovframework.example.sample.web.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

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
}
