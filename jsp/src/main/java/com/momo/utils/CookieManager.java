package com.momo.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	
	public CookieManager() {
		
	}
	
	/**
	 * 쿠키를 생성후 응답 객체에 저장
	 * 
	 * 쿠키를 생성 하기 위해 필요한 값
	 * - 쿠키이름, 쿠키값, 시간 
	 * 
	 * 사용자에게 응답하기 위해서
	 * - 응답 객체를 매개변수로 전달 받는다
	 */
	//static을 붙이면 생성하지 않고 사용 가능
	public static void makeCookie(
			HttpServletResponse response // 응답 객체에 추가하기 위해 response 사용
			, String name
			, String value
			, int time) {
		
		// 쿠키 생성
		Cookie cookie = new Cookie(name, value);
	
		// 유지 기간 설정
		cookie.setMaxAge(time);
		
		// 응답객체에 추가
		response.addCookie(cookie);
	}
	
	/*
	 * 요청 객체로부터 쿠키배열을 가지고 온뒤
	 * 원하는 쿠키이름을 찾아서 쿠키값을 반환
	 * @return
	 */
	public static String readCookie(
		HttpServletRequest request
		, String name) {
		String value = "";
		
		// 요청객체로부터 쿠키 배열을 획득
		Cookie[] cookies = request.getCookies();
		System.out.println("cookies : " + cookies);
		// 브라우저를 통해 처음 접근 했을때
		// 쿠키가 하나도 저장되어 있지 않은 경우 getCookies 메서드를 호출하면 null 반환
		 
		if(cookies != null) {		
			// 쿠키 배열을 돌면서 쿠키 이름이 일치하는 객체가 있는지 확인
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals(name)) {
					value = cookie.getValue();
					break;
				}
			}
		}	
		return value;
	}
	
	/*
	 * 쿠키를 삭제합니다
	 * @param response
	 * @param name 
	 */
	public static void deleteCookie(
			HttpServletResponse response
			, String name
			) {
		makeCookie(response, name, "", 0);	// 유지 시간을 0으로 만들어서 삭제
		
		
	}
	
}
