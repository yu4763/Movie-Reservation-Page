<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>

<title>둘러보시게 movie</title>
<link rel="stylesheet" href="css/all.css" type="text/css">
<link rel="stylesheet" href="css/admin.css" type="text/css">

</head>

<body>

    <script>

    function addrow(img,title,start_time,end_time){
        var my_tbody = document.getElementById('my-tbody');
        var row = my_tbody.insertRow(my_tbody.rows.length);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        cell1.innerHTML = title;
        cell1.width=150;
        cell1.style.textAlign = "center";
        i = document.createElement('img');
        i.src = img;
				i.width = 350;
				i.height = 200;
        cell2.appendChild(i);
        cell3.innerHTML = start_time + "~" + end_time;
        cell3.style.textAlign = "center";
        cell3.width=150;
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


   <%
   if( session.getAttribute("id") == null){
       response.sendRedirect("login.html");
     }
   else if(session.getAttribute("id").equals("admin") ){ %>

   <div class="leftnav">
   	<ul>
   		<li class="on-air"><a href="movie_afterlogin.jsp"><img class="index" src="img/index1.png"  width=250 height=100 ></a></li><br>
   		<li class="add/delete"><a href="admin.jsp"><img class="index" src="img/index2.png"  width=250 height=100></a></li><br>
   		<li class="list"><a href="user_list_show.jsp"><img class="index" src="img/index3.png"  width=250 height=100></a></li><br>
   	</ul>
   </div>

    <%}%>

<div class="movie_list">
   <table align="center" border ="1px solid black" style="font-size:1.3em; ">
		 	<br>
      <caption> <strong>[현재 상영중인 영화]<br> <br></strong> </caption>
      <thead>

            <th> 영화제목 </th>
            <th> 포스터  </th>
            <th> 상영 시간</th>

      </thead>
      <tbody id="my-tbody">

         </tbody>

   </table>
<br>

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

              ResultSet rs = stmt.executeQuery("select * from MOVIE order by title, start_time");
                  int i = 1;

              while(rs.next()){%>
                    <script>
                    addrow("<%=rs.getString("img_src")%>","<%=rs.getString("title")%>","<%=rs.getString("start_time")%>","<%=rs.getString("end_time")%>");
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
