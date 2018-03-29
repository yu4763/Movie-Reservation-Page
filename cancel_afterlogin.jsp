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

    function addtable(img,title,start_time,end_time,Auditorium,seat){
        var my_table = document.getElementById('my-table');

        var trObj = document.createElement('tr');
        var imgObj = document.createElement('td');
        var i = document.createElement('img');
        i.src = img;
        i.width = 250;
        i.height = 150;
        imgObj.appendChild(i);
        var titleObj = document.createElement('td');
        titleObj.innerHTML = title;
        titleObj.width = 250;
        titleObj.style.textAlign = "center"
        imgObj.appendChild(titleObj);
        trObj.appendChild(imgObj);
        var startObj = document.createElement('td');
        startObj.innerHTML = start_time + " ~ " + end_time;
        startObj.width = 180;
        startObj.style.textAlign = "center"
        trObj.appendChild(startObj);
        var whereObj = document.createElement('td');
        whereObj.innerHTML = Auditorium + "관";
        whereObj.width = 100;
        whereObj.style.textAlign = "center"
        trObj.appendChild(whereObj);
        var seatObj = document.createElement('td');
        seatObj.innerHTML = seat + " / 192";
        seatObj.width = 130;
        seatObj.style.textAlign = "center"
        var formtag = document.createElement('form');
        formtag.action="reservation_cancel.jsp";
        formtag.method="post";
        /*var cntinput = document.createElement('input');
        cntinput.style.width = "40px";
        cntinput.setAttribute('type', 'number');
        cntinput.setAttribute('name', 'cnt');
        cntinput.setAttribute('min', 1)
        cntinput.setAttribute('required', true);*/
        var titleinput = document.createElement('input');
        titleinput.style.width = "40px";
        titleinput.setAttribute('type', 'hidden');
        titleinput.setAttribute('name', 'movie');
        titleinput.setAttribute('value', title);
        var startinput = document.createElement('input');
        startinput.style.width = "40px";
        startinput.setAttribute('type', 'hidden');
        startinput.setAttribute('name', 'start');
        startinput.setAttribute('value', start_time);
        var reserveBut = document.createElement('button');
        reserveBut.innerHTML = "취소하기";
        reserveBut.setAttribute('type', 'submit');
        /*var cnttext = document.createElement('span')
        cnttext.innerHTML = "석 ";
        cnttext.style.fontSize = "14px";
        formtag.appendChild(cntinput);
        formtag.appendChild(cnttext);*/
        formtag.appendChild(reserveBut);
        formtag.appendChild(titleinput);
        formtag.appendChild(startinput);
        seatObj.appendChild(formtag);

        trObj.appendChild(seatObj);
        my_table.appendChild(trObj);

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
      <caption> <strong>[예매 취소]<br> <br></strong> </caption>

       <tr>
           <th>영화 제목</th>
           <th> 상영 시간</th>
           <th> 상영관</th>
           <th> 잔여 좌석</th>
       </tr>

      <tr ></tr>


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
              

              ResultSet rs = stmt.executeQuery("select * from MOVIE order by title, start_time");
                  

              while(rs.next()){
                    
                %>
                    <script>
                    addtable("<%=rs.getString("img_src")%>","<%=rs.getString("title")%>","<%=rs.getString("start_time")%>","<%=rs.getString("end_time")%>","<%=rs.getString("Auditorium")%>","<%=rs.getString("seat")%>");
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
