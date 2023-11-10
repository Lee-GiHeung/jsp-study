<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=request.getAttribute("list") %>

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
<%
	// getAttribute의 반환 타입은 Object이므로 형변환이 필요	
	// nullpointException을 방지하기 위해서 null 체크를 진행
	
	// 로그인 버튼이 나오려면 - 
	// 세션이 저장이 안되어 있는 상태(로그아웃 상태)에서 로그인 버튼이 나옴 
	
	// 로그아웃 버튼이 나오려면
	// 세션이 저장된 상태(로그인 상태)에서 로그아웃 버튼이 나옴
	
	if(session.getAttribute("userId") != null
		&& !"".equals(session.getAttribute("userId").toString())) {
		// 로그인한 사용자 - 로그아웃버튼 출력 -> 세션을 만료 시키고 로그인 페이지로 이동
%>
	<%=session.getAttribute("userId") %>님 환영합니다.
	<button id="logoutBtn">로그아웃</button>
<% 	
	} else {
		// 로그인하지 않은 사용자 - 로그인버튼 출력 -> 로그인 페이지로 이동		
%>
	<button id=loginBtn>로그인</button>

<% 		
	}

%>
</form>

<h2>게시글 목록</h2>
<%=request.getAttribute("list") %>
<table border="1">
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%	
	if(request.getAttribute("list") != null){
		List<BoardDto> list = (List<BoardDto>)request.getAttribute("list"); 
		for(BoardDto dto :list){
	%>
			
			<tr>
				<td><%= dto.getNum()%></td>
				<td><a href="/boardRead?num=<%=dto.getNum()%>"><%= dto.getTitle()%></a></td>
				<td><%= dto.getContent()%></td>
				<td><%= dto.getId()%></td>
				<td><%= dto.getPostdate()%></td>
				<td><%= dto.getVisitcount()%></td>

			</tr>
	<%	}
	} 
	%>
</table>

</body>
</html>