<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    request.setCharacterEncoding("utf-8");
    String movieinfo = request.getParameter("str2");
    String seat = request.getParameter("seat");





    String[] arr;
    String[] arr2;
    arr = movieinfo.split(","); //arr[0] is movie arr[1] is start
    arr2 = seat.split(","); // arr2[0] ...

    int cnt = arr2.length;
    int cnt2 =0;

   for (int i=0; i<cnt; i++){
        arr2[i] = "'" + arr2[i] + "'";
    }

    Connection conn;
    Statement stmt;


    try
    {
        String result ="";
        int r=1,r2;

        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
        stmt = conn.createStatement();

        for(int i=0; i<cnt ; i++){
        r = stmt.executeUpdate("delete from RESERVED where movie = " + arr[0] + " AND start_time = " + arr[1] + " AND seat_no = " + arr2[i] + " AND member_id = '" + (String)session.getAttribute("id") + "'" );
        result += arr2[i] + "번 ";
        if(r>0) cnt2++;
        if(r<=0) break;

        }

        r2 = stmt.executeUpdate("UPDATE MOVIE SET seat = seat + '" + String.valueOf(cnt2)  + "' WHERE title = " + arr[0] + "AND start_time = " + arr[1]);


        if (r>0) result += "예매 취소에 성공하였습니다.";
        else result += "은 본인이 예약한 좌석이 아닙니다. 본인이 예약한 좌석만 예매 취소에 성공하였습니다.";

        %>
        <script>
        alert("<%=result%>"); location.replace("cancel_afterlogin.jsp");

        </script>

        <%


        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );

        out.println(arr2[0]);
        out.println(arr2[1]);

    }

   %>
