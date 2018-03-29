<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    String img_src = request.getParameter("img_src");
    String auditorium = request.getParameter("auditorium");

    Connection conn;
    Statement stmt;

    try
    {
        int r;

        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();

        r = stmt.executeUpdate("insert into MOVIE" + "(title, start_time, end_time, img_src, Auditorium, seat)" + "values('" + title + "','" + start + "','" + end + "','" + img_src + "','" + auditorium +"'," + "192)");

        if( r>0 ){

            %> <script> alert("영화가 추가되었습니다."); location.replace("admin.jsp") </script> <%

        }
        else{
            %> <script> alert("영화 추가에 실패하였습니다"); history.go(-1); </script> <%
        }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
