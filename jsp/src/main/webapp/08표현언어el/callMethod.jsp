<%@page import="com.momo.el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyElClass myClass = new MyElClass();
	
	request.setAttribute("myClass", myClass);
	
%>
<h3>객체를 영역에 저장후 메서드 호출하기</h3>
<p>EL 표현언어를 사용하기 위해서는 내장객체의 영억에 저장되어야 있어야 합니다~!@!</p>
<br>000000-1000000 : ${myClass.getGender("000000-1000000") }
<br>000000-2000000 : ${myClass.getGender("000000-2000000") }
<br>000000-3000000 : ${myClass.getGender("000000-3000000") }
<br>000000-4000000 : ${myClass.getGender("000000-4000000") }
<br>000000-5000000 : ${myClass.getGender("000000-5000000") }
<br>000000-6000000 : ${myClass.getGender("000000-6000000") }

<!-- getter메서드를 이용해서 값을 출력 하므로 메서드가 없다면 오류가 발생할 수 있음 -->
<br>gender : ${myClass.gender }

<h3>정적메서드 호출하기</h3>
<%
	request.setAttribute("response", response);
	

%>
<br>response : ${response }
<br>CookieManager : ${CookieManager.makeCookie(response, "makeCookie", "EL사용", 100) }

<h3>메서드 호출하기</h3>
${"123-123".replace("-", "") }



</body>
</html>