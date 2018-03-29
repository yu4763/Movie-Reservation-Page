<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");

    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");


    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("select * from MEMBER");
        while(rs.next()){
          if(rs.getString("uid").equals(userID) && rs.getString("upwd").equals(userPW)){
            out.println(rs.getString("uid"));
            session.setAttribute("id", rs.getString("uid"));
            session.setAttribute("name", rs.getString("uname"));
            session.setAttribute("phone", rs.getString("uphone"));
            found = true;
            break;
          };
        }
        if(found){
          response.sendRedirect("index_afterlogin.html");
        }
        else{
          %> <script> alert("로그인에 실패하였습니다"); history.go(-1); </script> <%
        }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
