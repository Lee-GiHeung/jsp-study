<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 도서등록화면 -->
<%@ include file="/header.jsp" %>

<!-- 메인컨텐츠 영역 -->
<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
	    <div class="card-header py-3">
	       <h6 class="m-0 font-weight-bold text-primary">도서등록</h6>
	    </div>      
	    <div class="card-body">
			컨텐츠 작성
		
		</div>
	</div>
</div>
<!-- 메인컨텐츠 영역 끝-->

<h2>등록처리</h2>
<form name="">
		제목 : <input type="text">
	<br>작가 : <input type="text">
 	<button>등록</button>
</form>


<%@ include file="/footer.jsp" %>
</body>
</html>