<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript">
// 화면에서 동적인 처리
window.onload = function() {
	console.log('onload event =========');
	let logoutBtn = document.querySelector("#logoutBtn");
	let loginBtn = document.querySelector("#loginBtn");
	
	if(logoutBtn != null) {
		logoutBtn.onclick = function() {
			// 로그아웃
			loginForm.action = "/logout";
			loginForm.submit();
				
		}			
	}	
	if(loginBtn != null) {
		loginBtn.addEventListener('click', function(){
			// 로그인 페이지로 이동
			// 같은 경로에 있는 파일을 호출 했기 때문에 오류가 발생하지 않음
			loginForm.action = "/06session/servletEx/loginForm.jsp";
			loginForm.submit();
						
		});
	}
		
}	
	
</script>
<!-- 로그인 여부를 체크 
	로그인을 했을 때 = 세션에 userId가 저장되어 있으면 
		- 로그아웃 버튼 출력
		- 로그인 버튼을 출력
-->
<!-- 
	submit : form의 요소들을 파라미터로 가지고 서버에 요청
	action : 서버에 요청할 url주소
	method : 요청 방식
		- GET : 조회용 파라미터
		- POST : 등록, 수정용 파라미터
	
	* 버튼 생성했더라도 form안에 버튼이 하나밖에 없다면 해당 버튼은 submit 버튼이 됨	
	
 -->
<form method="get" name="loginForm">
	<c:if test="${empty userId }">
		<button id="loginBtn" class="btn btn-primary">로그인</button>
	</c:if>
	
	<c:if test="${not empty userId }">
		${userId }님 환영합니다.
		<button id="logoutBtn" class="btn btn-danger">로그아웃</button>
	</c:if>
</form>

<h2>게시글 목록</h2> 	
<table class="table" border="1">
  <thead>
    <tr>
	    <th scope="col">일련번호</th>
	    <th scope="col">내용</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
		<!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다. 출력 -->
		<!-- 만약 리스트의 사이즈가 0이 아니라면 목록을 출력 -->
		<c:if test="${empty list }" var="result">
			<tr><td colspan="6">조회된 데이터가 존재하지 않습니다</td></tr>
		</c:if>
		
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.num }</td>
				<td><a href="/boardRead?num=${dto.num}">${dto.title }</a></td>
				<td>${dto.content }</td>
				<td>${dto.id }</td>
				<td>${dto.postdate }</td>
				<td>${dto.visitcount }</td>
			</tr>
		</c:forEach>
	 </tbody>
</table>

<!-- pageNavi include -->
<%@include file ="pageNavi.jsp" %>

</body>
</html>