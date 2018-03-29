<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String myname = request.getParameter("myname");
    String myid = request.getParameter("myid");
    String mypassword = request.getParameter("mypassword");
    String myphone = request.getParameter("myphone");

    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {



        int r;

        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();


        ResultSet rs = stmt.executeQuery("select * from MEMBER");
        while(rs.next()){
          if(rs.getString("uid").equals(myid)){
            %> <script> alert("이미 존재하는 아이디입니다. 아이디를 바꿔주세요"); history.go(-1); </script> <%
            stmt.close();
            conn.close();
            return;
          };
        }

        r = stmt.executeUpdate("insert into MEMBER" + "(uname, uid, upwd, uphone, ureserve)" + "values('" + myname + "','" + myid + "','" + mypassword + "','" + myphone + "'," + "0)");

        if( r>0 ){

            %> <script> alert("회원가입에 성공하였습니다"); location.replace("login.html") </script> <%

        }
        else{
            %> <script> alert("회원가입에 실패하였습니다"); history.go(-1); </script> <%
        }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
