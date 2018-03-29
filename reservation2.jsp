<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    request.setCharacterEncoding("utf-8");
    String seat = request.getParameter("str");

    String[] arr;
    arr = seat.split(",");
    int cnt = Integer.parseInt(arr[0]);

    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {

        int r;
        String result="";

        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();

        for(int i=3; i<cnt+3; i++){
            r = stmt.executeUpdate("insert into RESERVED" + "(movie, start_time, seat_no, member_id)" + "values(" + arr[1] + "," + arr[2]+ "," + arr[i] + ",'" + (String)session.getAttribute("id") + "')");
              if( r>0 ){
            result += arr[i] + "번 ";
          }
      }
      result += "좌석 예매에 성공하였습니다";


      ResultSet rs = stmt.executeQuery("select * from MEMBER where uid = " + "'" +(String)session.getAttribute("id") + "'");
      int num = 0;
      if(rs.next()){
        num = rs.getInt("ureserve");
        num += cnt;
      }
      StringBuilder sb = new StringBuilder();
      String sql = sb.append("update MEMBER set")
              .append(" ureserve = ")
              .append( num )
              .append(" where uid = ")
              .append( "'" +(String)session.getAttribute("id") + "'")
              .append(";").toString();
      stmt.executeUpdate(sql);


      rs = stmt.executeQuery("select * from MOVIE where title = " + arr[1] + " and start_time = " + arr[2]);
      num = 0;
      if(rs.next()){
        num = rs.getInt("seat");
        num -= cnt;
      }

      StringBuilder sb2 = new StringBuilder();
      String sql2 = sb2.append("update MOVIE set")
              .append(" seat = ")
              .append( num )
              .append(" where title = ")
              .append( arr[1])
              .append(" and start_time = ")
              .append(arr[2])
              .append(";").toString();
      stmt.executeUpdate(sql2);

      %><script> alert("<%=result%>"); location.replace("lookup_afterlogin.jsp"); </script> <%

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }

   %>
