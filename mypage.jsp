<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (session.getAttribute("id") == null) {
			 response.sendRedirect("login.html");
	 }
%>

<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>

<title>어서오시게 mypage</title>

<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/signup.css" type="text/css">

<script>
function logout(){
	location.replace("logout.jsp");
}
function withdraw(){
	location.replace("withdraw.jsp");
}
function lookup(){
    location.replace("lookup_afterlogin.jsp");
}
    
function cancel(){
    location.replace("cancel_afterlogin.jsp");
}
    

</script>
</head>

<body>

	<div class="header">
		<a href="./index_afterlogin.html"><img class="title" src="img/titlepic.png"></a>
	</div>

	<div class="nav">
		<a href="./mypage.jsp"><img class="link" src="img/마이페이지.png"></a>
		<a href="./movie_afterlogin.jsp"><img class="link" src="img/둘러보시게.png"></a>
		<a href="./reserve_afterlogin.jsp"><img class="link" src="img/예매하시게.png"></a>
	</div>
	
	<form>
		<table width="60%" align="center">
			<p>

			<strong>[내 정보]</strong><br>

			<fieldset name="private">

			<legend align="center">private</legend>
			이&nbsp; &nbsp; &nbsp; 름: &nbsp;<%=session.getAttribute("name")%><br>

			아 이 디&nbsp;: &nbsp;<%=session.getAttribute("id")%> <br>

			</fieldset>

			<br>

			<fieldset name="phone">

			<legend align="center">phone</legend>

			휴대전화: &nbsp;<%=session.getAttribute("phone")%><br>

			</fieldset>
			</p>

			<button type="button" onclick= "withdraw()">회원탈퇴</button>
			<button type="button" onclick="logout()">로그아웃</button>
            <button type="button" onclick="lookup()">예매확인</button>
            <button type="button" onclick="cancel()">예매취소</button>

		</table>
	</form>

</body>
</html>
