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

<title>둘러보시게 movie</title>
<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/admin.css" type="text/css">


</head>

<body>

    <script>

    function addrow(uname,uid,uphone,ureserve){
        var my_tbody = document.getElementById('my-tbody');
        var row = my_tbody.insertRow(my_tbody.rows.length);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell3
        cell1.innerHTML = uname;
				cell1.width=150;
				cell1.style.textAlign = "center";
        cell2.innerHTML = uid;
				cell2.width=150;
				cell2.style.textAlign = "center";
        cell3.innerHTML = uphone;
				cell3.width=150
				cell3.style.textAlign = "center";
        cell4.innerHTML = ureserve;
			  cell4.width=100;
				cell4.style.textAlign = "center";

    }

   </script>


   <div class="header">
      <a href="./index_afterlogin.html"><img class="title" src="img/titlepic.png"></a>
   </div>

   <div class="nav">
      <a href="./mypage.jsp"><img class="link" src="img/마이페이지.png"></a>
      <a href="./movie_afterlogin.jsp"><img class="link" src="img/둘러보시게.png"></a>
      <a href="./reserve_afterlogin.jsp"><img class="link" src="img/예매하시게.png" border="aqua 1px solid"></a>
   </div>

   <div class="leftnav">
   	<ul>
   		<li class="on-air"><a href="movie_afterlogin.jsp"><img class="index" src="img/index1.png"  width=250 height=100 ></a></li><br>
   		<li class="add/delete"><a href="admin.jsp"><img class="index" src="img/index2.png"  width=250 height=100></a></li><br>
   		<li class="list"><a href="user_list_show.jsp"><img class="index" src="img/index3.png"  width=250 height=100></a></li><br>
   	</ul>
   </div>

<div class="movie_list">
   <table align="center" border ="1px solid black" style="font-size:1.5em; ">
		 	<br><br><br>
      <caption> <strong>[회원 리스트] <br><br></strong> </caption>
      <thead>

            <th width="20%"> 이름 </th>
            <th width="20%"> ID  </th>
            <th width="40%"> 휴대폰 번호</th>
            <th width="20%"> 예약 </th>

      </thead>
      <tbody id="my-tbody">

         </tbody>

   </table>
</div>

</body>

</html>


      <%
          Connection conn;
          Statement stmt;

          try
          {
              Class.forName( "com.mysql.jdbc.Driver" );
              conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
              stmt = conn.createStatement();

              ResultSet rs = stmt.executeQuery("select * from MEMBER");
                  int i = 1;

              while(rs.next()){%>
                    <script>
                    addrow("<%=rs.getString("uname")%>","<%=rs.getString("uid")%>","<%=rs.getString("uphone")%>","<%=rs.getString("ureserve")%>");
                    </script>
                        <%
              }

              stmt.close();
              conn.close();
          }
          catch( Exception ex )
          {
              out.println( ex.getMessage() );
          }
  %>
