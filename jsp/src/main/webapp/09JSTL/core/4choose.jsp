<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>
<!-- 변수선언 -->
<c:set var="num" value="101"/>

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${num mod 2 eq 0 }">
		num(${num })은 짝수 입니다.
	</c:when>
	
	<c:otherwise>
		num(${num })은 홀수 입니다.
	</c:otherwise>
	
</c:choose>

<h4>국,영,수 점수를 입력하면 평균을 내어 학점을 출력</h4>
<p>>=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점</p>

<!-- form에 action을 주지 않을 경우, 동일한 페이지를 다시 요청함 -->
<form>
	국어 : <input type="text" name="kor"><br>
	영어 : <input type="text" name="eng"><br>
	수학 : <input type="text" name="math"><br>

	<button type="submit">학점 구하기</button>


</form>
<!-- 동일한 페이지가 다시 요청되어 form태그 안에 요소를 출력 -->
국어점수 : ${param.kor }<br>
영어점수 : ${param.eng }<br>
수학점수 : ${param.math }<br>

<c:choose>
	<c:when test=""></c:when>
</c:choose>

</body>
</html>