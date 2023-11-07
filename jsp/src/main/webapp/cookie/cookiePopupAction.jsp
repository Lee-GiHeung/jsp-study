<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>팝업용 쿠키를 생성하는 페이지</h2>

<% 
	// inactiveToday 값 출력 
	// value 속성의 값 = request.getParameter("name 속성의 값");
	out.print("inactiveToday : " + request.getParameter("inactiveToday"));
	
	if("Y".equals(request.getParameter("inactiveToday"))) {
		// 팝업닫기(popupClose, Y) 쿠키 생성
		CookieManager.makeCookie(response, "popupClose", "Y", 3600);
		
		// cookiePopupMain 페이지로 페이지 전환
		response.sendRedirect("cookiePopupMain.jsp");
		
	}		
	
%>

</body>
</html>