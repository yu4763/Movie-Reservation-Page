<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String id = (String)session.getAttribute("id");

    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {

        int r;

        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();

        r = stmt.executeUpdate("delete from MEMBER where uid = " + "'" +  id + "'" );

        if( r >0 ){
            %> <script> alert("탈퇴되었습니다."); location.replace("index.html") </script> <%
        }
        else{
            %> <script> alert("회원탈퇴에 실패하였습니다"); history.go(-1); </script> <%
        }


        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
