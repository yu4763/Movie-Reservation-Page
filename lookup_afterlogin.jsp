<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>

<title>예매정보확인 movie</title>
<link rel="stylesheet" href="css/all.css" type="text/css">

</head>

<body>

    <script>

    function addtable(movie,start_time,seat_no){
        var my_table = document.getElementById('my-table');

        var trObj = document.createElement('tr');
        
        var movieObj = document.createElement('td');
        movieObj.innerHTML = movie;
        movieObj.width = 250;
        movieObj.style.textAlign = "center"
        
        trObj.appendChild(movieObj);
        var startObj = document.createElement('td');
        startObj.innerHTML = start_time;
        startObj.width = 180;
        startObj.style.textAlign = "center"
        trObj.appendChild(startObj);
        
        var seatObj = document.createElement('td');
        seatObj.innerHTML = seat_no;
        seatObj.width = 130;
        seatObj.style.textAlign = "center"
        
        
        trObj.appendChild(seatObj);
        my_table.appendChild(trObj);

    }
        
    function cancel(){
    location.replace("cancel_afterlogin.jsp");
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

<div >
   <table id='my-table' align="center" border ="1px solid black" style="font-size:1.3em; " >
		 	<br>
      <caption> <strong>[예매 정보 확인]<br> <br></strong> </caption>

       <tr>
           <th>영화 제목</th>
           <th> 시작 시간</th>
           <th> 좌석 번호</th>

       </tr>

      <tr ></tr>


   </table>
    
    <br><br>
    
    <div align="center"><button type="button" onclick="cancel()">예매취소</button></div>

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
              

              ResultSet rs = stmt.executeQuery("select * from RESERVED");
                  

              while(rs.next()){
                    String myid = (String)session.getAttribute("id");
                    if (rs.getString("member_id").equals(myid)){  
                %>
                    <script>
                    addtable("<%=rs.getString("movie")%>","<%=rs.getString("start_time")%>","<%=rs.getString("seat_no")%>");
                    </script>
                <%
                   }
                }    
    
    
                
                    
               
            

              stmt.close();
              conn.close();
                   
          }
          catch( Exception ex )
          {
              out.println( ex.getMessage() );
          }
                %>
