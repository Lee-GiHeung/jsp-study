<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	List<Object> aList = new ArrayList<>();
	aList.add("문자열");	
	aList.add(new Person("lgh", 28));
	
	// 페이지 영역에 리스트 저장
	// EL 표현언어를 사용하기 위해서 내장 객체에 값이 저장을 해야 출력이 됨!!!!!!!!!!
	pageContext.setAttribute("aList", aList);
	
%>

<h2>List 컬렉션</h2>
<!-- 영역을 지정하지 않아도 작은영역부터 탐색해서 있으면 출력 -->
<br>${aList } 
<!-- 
	객체의 주소값이 출력 (toString() 메서드의 호출결과) 
	-> toString()을 재정의 한 경우, 해당 메서드의 실행 결과가 출력
-->	
<br>${aList[0] }	
<br>${aList[1] }	
<br>${aList[1].name }	
<br>${aList[1].age }	
<!-- 값이 없어도 오류가 발생하지 않음 -->
<br>없어도 오류가 발생하지 않는다 === ${aList[2].age }	

<h3>Map 컬렉션</h3>
<%
	Map<String, String> map = new HashMap<>();
	// key, value 
	map.put("한글", "모모");
	map.put("영어", "momo");

	pageContext.setAttribute("map", map);
		
%>

<ul>
	<li>
		한글
		<p>${map['한글'] }</p>
		<p>${map["한글"] }</p>
		<!-- 
			한글은 .을 찍어서 접근 할 수 없다!!!
		 	\${} : 주석처리
		 -->
		<p>\${map.한글 } : 오류발생으로 주석 처리</p>
		<p><%=map.get("한글") %></p>	
	</li>
	<li>
		<p>${map['Eng'] }</p>
		<p>${map["Eng"] }</p>
		<p>${map.Eng }</p>
		<p><%=map.get("Eng") %></p>
	</li>
	
</ul>

</body>
</html>