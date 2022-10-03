<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
iframe#ifrNotice {
	width: 100%;
	height: 300px;
	
}

iframe#ifrInquire {
width: 100%;
height: 600px;
}
</style>
<script src="/script/jquery-3.6.0.min.js"></script>
<script src="/script/script_Inquire.js"></script>

<body>

	<button id="noticeBtn">공지사항</button>
	<button id="personalBtn">1:1문의</button>
	<button id="Anser">자주하는 질문</button>



	<iframe id="ifrNotice" src="/bbs_Notice/noticebbs.jsp" frameborder="0">
	</iframe>

	<iframe id="ifrInquire" src="/bbs_Inquire/inquirebbs.jsp"
		frameborder="0" scrolling="no"> </iframe>



</body>
</html>