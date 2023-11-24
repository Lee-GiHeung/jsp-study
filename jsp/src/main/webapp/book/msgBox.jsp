<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메세지 출력후 다른 페이지를 요청 하거나 뒤로가기 함 -->
<script type="text/javascript">
	// 서버로부터 전달받은 메세지를 출력
	let msg = '${msg}';
	// 서버로부터 전달 받은 url로 이동함
	// 단, url이 없다면 뒤로가기함
	
	let url = '${url}';
	
	if(msg != '') {
		alert(msg);
	} 
	if(url != '') {
		location.href = url;
	} else {
		history.go(-1);
	}
</script>
</body>
</html>