<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (session.getAttribute("id") == null) {
			response.sendRedirect("login.html");
	 }
else if(!session.getAttribute("id").equals("admin")){
	  response.sendRedirect("index_afterlogin.html");
}
%>

<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>

<title>관리하시게 admin</title>

<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/signup.css" type="text/css">
<link rel="stylesheet" href="css/admin.css" type="text/css">

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

<div class="leftnav">
	<ul>
		<li class="on-air"><a href="movie_afterlogin.jsp"><img class="index" src="img/index1.png"  width=250 height=100 ></a></li><br>
		<li class="add/delete"><a href="admin.jsp"><img class="index" src="img/index2.png"  width=250 height=100></a></li><br>
		<li class="list"><a href="user_list_show.jsp"><img class="index" src="img/index3.png"  width=250 height=100></a></li><br>
	</ul>
</div>

<div class = "movie_list">
	<table align="center">
			<p>

		<form action="admin_add.jsp" method="post">
			<fieldset name="addmovie">

			<legend align="center"><strong>[영화 추가]</strong></legend>

			영화 제목 : <input type="text" id="addtitle" name="title" required><br>

			시작 시간 : <input type="time" id="start" name="start" required><br>

			종료 시간 : <input type="time" id="end" name="end" required><br>

			파일 경로 : <input type="text" id="image" name="img_src" required><br>

			상영 위치 : <input type="text" id="auditorium" name="auditorium">(관)<br><br>

			<button type="submit" name="adminbutton">추가 하기</button>

			</fieldset>
		</form>

			<br>

		<form action="admin_delete.jsp" method="post">
			<fieldset name="deletemovie">

			<legend align="center"><strong>[영화 삭제]</strong></legend>

			영화 제목: <input type="text" id="deletetitle" name="deletetitle" required><br>

			시작 시간: <input type="time" id="deletestart" name="deletestart" required><br><br>

			<button type="submit" name="adminbutton">삭제 하기</button>
			</fieldset>
		</form>

			</p>


	</table>
</div>
</body>
</html>
