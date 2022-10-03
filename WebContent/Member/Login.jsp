<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel = "stylesheet" href="/style/logn_style.css">
	<link rel = "shortcyt icon" href="#">
	<script src ="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src ="/script/script_Join&Login.js"></script>
</head>
<body>
<iframe src="/indd/header.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	<div id="loginWrap">
     <table id="certifyTBL">
     <tbody>
     <tr>
     <td id="uIdSelect">아이디</td>
     <td id="phoneSelect">휴대폰번호</td>
     </tr>
     </tbody>
     </table>
     <!-- certifyTBL -->
     <form action="/Member/Login_Proc.jsp" id="loginFrm">
     <table id="loginTBL">
                    <tbody>
                        <tr>
                            <td>
                                 <input type="text" name="uId" id="uId"
                                 placeholder="아이디" />
                            </td>
                            <td rowspan="2" id="tdLogInBtn">
                                <button>LOG IN</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" name="uPw" id="uPw"
                                placeholder="비밀번호" />
                            </td>
                        </tr>
                    </tbody>
                </table>
     </form>
	</div>
	<iframe src="/indd/footer.jsp" scrolling="no" width="100%" frameborder=0></iframe>
</body>
</html>