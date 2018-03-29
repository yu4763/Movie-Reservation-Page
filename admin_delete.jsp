<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("deletetitle");
    String start = request.getParameter("deletestart");

    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {
      int r;

      Class.forName( "com.mysql.jdbc.Driver" );
      conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
      stmt = conn.createStatement();

      r = stmt.executeUpdate("delete from MOVIE where title = " + "'" +  title + "'" + " and start_time = " + "'" + start + "'" );

      if( r >0 ){
          %> <script> alert("영화가 삭제되었습니다."); location.replace("admin.jsp") </script> <%
      }
      else{
          %> <script> alert("해당 영화가 존재하지 않습니다."); history.go(-1); </script> <%
      }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
