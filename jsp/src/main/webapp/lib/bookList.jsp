<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- header 외부파일 include -->
<%@ include file="common/header.jsp" %>

<!-- 도서목록 출력 합니다. -->
도서목록을 출력합니다.
<br>${list }

<table border="1">
	<tr>
		<td>순번</td>
		<td>제목</td>
		<td>저자</td>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.no }</td>
			<td>${dto.title }</td>
			<td>${dto.author }</td>		
		</tr>	
	</c:forEach>
</table>


<!-- footer 외부파일 include -->
<%@ include file="common/footer.jsp" %>

</body>
</html>