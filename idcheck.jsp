<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


    request.setCharacterEncoding("utf-8");
    String myid = request.getParameter("id");

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
          if(rs.getString("uid").equals(myid)){
            found = true;
            break;
          };
        }
        if(found){
           out.println( "'" +  myid + "'" + "는(은) 이미 존재하는 아이디입니다.");
        }
        else{
          out.println("'" +  myid + "'" +" 는(은) 사용가능한 아이디 입니다.");
        }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
  %>
