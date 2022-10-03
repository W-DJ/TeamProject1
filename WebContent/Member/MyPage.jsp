<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<%@page import="java.util.List"%>
<%@page import="pack_Member.MemberBean"%>
<jsp:useBean id="objMgr" class="pack_Member.MemberMgr" scope= "page"/>
<%
String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session");
String uId = request.getParameter("uId");
List<MemberBean> objList = objMgr.mtd_Select();
			 
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charset="UTF-8">
	  <title>Insert title here</title>
	  <link rel="stylesheet" href="/style/Mypage.css">
	  <link rel="shorcut icon" href="#">
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="/script/script_Member.js"></script>
	</head>
  <body>
	<div id="wrap">
	<iframe src="/indd/header.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	<% if(uId_Session!=null) {
				
			 %>

	<div id="MyPageArea" class="dFlex">
	<ul class="List">
	 <li><a href="">장바구니</a></li>
	 <li><a href="">찜 제품</a></li>
	 <li><a href="">주문현황</a></li>
	 <li><a href="/bbs_Inquire/inquirebbs.jsp">1대1문의</a></li>
	 <!-- MyPageMain에 iframe으로 넣는게 어떨까 싶어요 -->
	 <li><a href="">내 쿠폰</a></li>
	 <hr>
	 <li><a href="/Member/MemberMod.jsp">회원정보수정</a></li>
	 <li><a href="/Member/MemberDel.jsp">회원탈퇴</a></li>
	</ul>
	 <div id="MyPageMain">
	  <h4>마이페이지</h4>
      	 
	 </div>
	 <div id="orderArea"></div>
	 <div id="reviewArea"></div>
	 <div id="goodsReco"></div>
	</div>
     <% } else if (aId_Session!=null) { %>
	<ul>
	 <li><a href="/Member/MemList.jsp">회원목록/수정/삭제</a></li>
	 <li><a href="">회원주문현황/수정/삭제</a></li>
	</ul>
	<div id="MyPageArea">

     </div>
     <!-- div#MyPageArea -->
	<%}else{%>
	 <script>
	 alert("로그인 후 이용이 가능합니다")
	 location.href="/Member/Login.jsp";
	 </script>
	<%}%>
	<iframe src="/indd/footer.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	</div>
	<!--div#wrap-->
  </body>
</html>