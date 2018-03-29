<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");


	String movie = request.getParameter("movie");
	String start = request.getParameter("start");
%>

<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>

<title>예매하시게 reserve</title>
<link rel="stylesheet" href="css/all.css" type="text/css">

</head>

<body>
	<script>

	var count=0;

	function drawseat(idx){
        var seatObj = document.getElementById('seat');

        var trObj = document.createElement('tr');

        for (var i=0; i<=16; i++){
            var tdObj = document.createElement('td');
            if (i==0){
                tdObj.innerHTML = String.fromCharCode(64+idx);
            }
            else{
                var seatbutton = document.createElement('button');
                seatbutton.innerHTML = i;
                seatbutton.className = "available";
                seatbutton.onclick = select(seatbutton);
                tdObj.appendChild(seatbutton);
            }
            trObj.appendChild(tdObj);
        }


        seatObj.appendChild(trObj);


	}

    function show_selected(count){
        var printObj = document.getElementById('print');

        var test = document.getElementsByName('selected[]');
        var i=0;
        var s= "선택한 좌석 : "
        for(var i=0;i<count;i++){
            if(i==count-1){
                s += test[i].value + "번";
            }
            else{
                s += test[i].value + "번, ";
            }

        }
        printObj.innerHTML = s;

    }




    function change_reserved(seat){
        var rowObj = document.getElementsByClassName(seat);
            rowObj[0].style.background="gray";
            rowObj[0].style.color="white";
            rowObj[0].name = "reserved[]";
            rowObj[0].disabled = 'disabled';
            rowObj[0].value = " X ";
            }

    function change_user_reserved(seat){
        var rowObj = document.getElementsByClassName(seat);
            rowObj[0].style.background="red";
            rowObj[0].style.color="white";
            rowObj[0].name = "reserved[]";
            rowObj[0].disabled = 'abled';


            }




	function change(object, event){

        if(object.name == "reserved[]"){
            object.style.background="white";
            object.style.color = "black";

        }

        //show_selected(count);

	}

    function reserve(){

        var movie = "'" + "<%=movie%>" + "'";
        var start = "'" + "<%=start%>" + "'";

        var s= movie + "," + start;



        document.getElementById('str2').value = s;






        return true;

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

    <div>
    <form action="reservation_cancel2.jsp" method="post" name="textform" onsubmit="return reserve();">
    <table align ="center" style="text-align:center;">
    <tr>
    <th colspan=17> SCREEN </th>
    </tr>
    <tbody id='seat'>
        <tr>
            <td>A</td>
            <td><input type="button" value="A1" onclick="change(this)" name="available[]" class="A1" style="background-color: white;"></td>
            <td><input type="button" value="A2" onclick="change(this)" name="available[]" class="A2" style="background-color: white;"></td>
            <td><input type="button" value="A3" onclick="change(this)" name="available[]" class="A3" style="background-color: white;"></td>
            <td><input type="button" value="A4" onclick="change(this)" name="available[]" class="A4" style="background-color: white;"></td>
            <td><input type="button" value="A5" onclick="change(this)" name="available[]" class="A5" style="background-color: white;"></td>
            <td><input type="button" value="A6" onclick="change(this)" name="available[]" class="A6" style="background-color: white;"></td>
            <td><input type="button" value="A7" onclick="change(this)" name="available[]" class="A7" style="background-color: white;"></td>
            <td><input type="button" value="A8" onclick="change(this)" name="available[]" class="A8" style="background-color: white;"></td>
            <td><input type="button" value="A9" onclick="change(this)" name="available[]" class="A9" style="background-color: white;"></td>
            <td><input type="button" value="A10" onclick="change(this)" name="available[]" class="A10" style="background-color: white;"></td>
            <td><input type="button" value="A11" onclick="change(this)" name="available[]" class="A11" style="background-color: white;"></td>
            <td><input type="button" value="A12" onclick="change(this)" name="available[]" class="A12" style="background-color: white;"></td>
            <td><input type="button" value="A13" onclick="change(this)" name="available[]" class="A13" style="background-color: white;"></td>
            <td><input type="button" value="A14" onclick="change(this)" name="available[]" class="A14" style="background-color: white;"></td>
            <td><input type="button" value="A15" onclick="change(this)" name="available[]" class="A15" style="background-color: white;"></td>
            <td><input type="button" value="A16" onclick="change(this)" name="available[]" class="A16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>B</td>
            <td><input type="button" value="B1" onclick="change(this)" name="available[]" class="B1" style="background-color: white;"></td>
            <td><input type="button" value="B2" onclick="change(this)" name="available[]" class="B2" style="background-color: white;"></td>
            <td><input type="button" value="B3" onclick="change(this)" name="available[]" class="B3" style="background-color: white;"></td>
            <td><input type="button" value="B4" onclick="change(this)" name="available[]" class="B4" style="background-color: white;"></td>
            <td><input type="button" value="B5" onclick="change(this)" name="available[]" class="B5" style="background-color: white;"></td>
            <td><input type="button" value="B6" onclick="change(this)" name="available[]" class="B6" style="background-color: white;"></td>
            <td><input type="button" value="B7" onclick="change(this)" name="available[]" class="B7" style="background-color: white;"></td>
            <td><input type="button" value="B8" onclick="change(this)" name="available[]" class="B8" style="background-color: white;"></td>
            <td><input type="button" value="B9" onclick="change(this)" name="available[]" class="B9" style="background-color: white;"></td>
            <td><input type="button" value="B10" onclick="change(this)" name="available[]" class="B10" style="background-color: white;"></td>
            <td><input type="button" value="B11" onclick="change(this)" name="available[]" class="B11" style="background-color: white;"></td>
            <td><input type="button" value="B12" onclick="change(this)" name="available[]" class="B12" style="background-color: white;"></td>
            <td><input type="button" value="B13" onclick="change(this)" name="available[]" class="B13" style="background-color: white;"></td>
            <td><input type="button" value="B14" onclick="change(this)" name="available[]" class="B14" style="background-color: white;"></td>
            <td><input type="button" value="B15" onclick="change(this)" name="available[]" class="B15" style="background-color: white;"></td>
            <td><input type="button" value="B16" onclick="change(this)" name="available[]" class="B16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>C</td>
            <td><input type="button" value="C1" onclick="change(this)" name="available[]" class="C1" style="background-color: white;"></td>
            <td><input type="button" value="C2" onclick="change(this)" name="available[]" class="C2" style="background-color: white;"></td>
            <td><input type="button" value="C3" onclick="change(this)" name="available[]" class="C3" style="background-color: white;"></td>
            <td><input type="button" value="C4" onclick="change(this)" name="available[]" class="C4" style="background-color: white;"></td>
            <td><input type="button" value="C5" onclick="change(this)" name="available[]" class="C5" style="background-color: white;"></td>
            <td><input type="button" value="C6" onclick="change(this)" name="available[]" class="C6" style="background-color: white;"></td>
            <td><input type="button" value="C7" onclick="change(this)" name="available[]" class="C7" style="background-color: white;"></td>
            <td><input type="button" value="C8" onclick="change(this)" name="available[]" class="C8" style="background-color: white;"></td>
            <td><input type="button" value="C9" onclick="change(this)" name="available[]" class="C9" style="background-color: white;"></td>
            <td><input type="button" value="C10" onclick="change(this)" name="available[]" class="C10" style="background-color: white;"></td>
            <td><input type="button" value="C11" onclick="change(this)" name="available[]" class="C11" style="background-color: white;"></td>
            <td><input type="button" value="C12" onclick="change(this)" name="available[]" class="C12" style="background-color: white;"></td>
            <td><input type="button" value="C13" onclick="change(this)" name="available[]" class="C13" style="background-color: white;"></td>
            <td><input type="button" value="C14" onclick="change(this)" name="available[]" class="C14" style="background-color: white;"></td>
            <td><input type="button" value="C15" onclick="change(this)" name="available[]" class="C15" style="background-color: white;"></td>
            <td><input type="button" value="C16" onclick="change(this)" name="available[]" class="C16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>D</td>
            <td><input type="button" value="D1" onclick="change(this)" name="available[]" class="D1" style="background-color: white;"></td>
            <td><input type="button" value="D2" onclick="change(this)" name="available[]" class="D2" style="background-color: white;"></td>
            <td><input type="button" value="D3" onclick="change(this)" name="available[]" class="D3" style="background-color: white;"></td>
            <td><input type="button" value="D4" onclick="change(this)" name="available[]" class="D4" style="background-color: white;"></td>
            <td><input type="button" value="D5" onclick="change(this)" name="available[]" class="D5" style="background-color: white;"></td>
            <td><input type="button" value="D6" onclick="change(this)" name="available[]" class="D6" style="background-color: white;"></td>
            <td><input type="button" value="D7" onclick="change(this)" name="available[]" class="D7" style="background-color: white;"></td>
            <td><input type="button" value="D8" onclick="change(this)" name="available[]" class="D8" style="background-color: white;"></td>
            <td><input type="button" value="D9" onclick="change(this)" name="available[]" class="D9" style="background-color: white;"></td>
            <td><input type="button" value="D10" onclick="change(this)" name="available[]" class="D10" style="background-color: white;"></td>
            <td><input type="button" value="D11" onclick="change(this)" name="available[]" class="D11" style="background-color: white;"></td>
            <td><input type="button" value="D12" onclick="change(this)" name="available[]" class="D12" style="background-color: white;"></td>
            <td><input type="button" value="D13" onclick="change(this)" name="available[]" class="D13" style="background-color: white;"></td>
            <td><input type="button" value="D14" onclick="change(this)" name="available[]" class="D14" style="background-color: white;"></td>
            <td><input type="button" value="D15" onclick="change(this)" name="available[]" class="D15" style="background-color: white;"></td>
            <td><input type="button" value="D16" onclick="change(this)" name="available[]" class="D16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>E</td>
            <td><input type="button" value="E1" onclick="change(this)" name="available[]" class="E1" style="background-color: white;"></td>
            <td><input type="button" value="E2" onclick="change(this)" name="available[]" class="E2" style="background-color: white;"></td>
            <td><input type="button" value="E3" onclick="change(this)" name="available[]" class="E3" style="background-color: white;"></td>
            <td><input type="button" value="E4" onclick="change(this)" name="available[]" class="E4" style="background-color: white;"></td>
            <td><input type="button" value="E5" onclick="change(this)" name="available[]" class="E5" style="background-color: white;"></td>
            <td><input type="button" value="E6" onclick="change(this)" name="available[]" class="E6" style="background-color: white;"></td>
            <td><input type="button" value="E7" onclick="change(this)" name="available[]" class="E7" style="background-color: white;"></td>
            <td><input type="button" value="E8" onclick="change(this)" name="available[]" class="E8" style="background-color: white;"></td>
            <td><input type="button" value="E9" onclick="change(this)" name="available[]" class="E9" style="background-color: white;"></td>
            <td><input type="button" value="E10" onclick="change(this)" name="available[]" class="E10" style="background-color: white;"></td>
            <td><input type="button" value="E11" onclick="change(this)" name="available[]" class="E11" style="background-color: white;"></td>
            <td><input type="button" value="E12" onclick="change(this)" name="available[]" class="E12" style="background-color: white;"></td>
            <td><input type="button" value="E13" onclick="change(this)" name="available[]" class="E13" style="background-color: white;"></td>
            <td><input type="button" value="E14" onclick="change(this)" name="available[]" class="E14" style="background-color: white;"></td>
            <td><input type="button" value="E15" onclick="change(this)" name="available[]" class="E15" style="background-color: white;"></td>
            <td><input type="button" value="E16" onclick="change(this)" name="available[]" class="E16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>F</td>
            <td><input type="button" value="F1" onclick="change(this)" name="available[]" class="F1" style="background-color: white;"></td>
            <td><input type="button" value="F2" onclick="change(this)" name="available[]" class="F2" style="background-color: white;"></td>
            <td><input type="button" value="F3" onclick="change(this)" name="available[]" class="F3" style="background-color: white;"></td>
            <td><input type="button" value="F4" onclick="change(this)" name="available[]" class="F4" style="background-color: white;"></td>
            <td><input type="button" value="F5" onclick="change(this)" name="available[]" class="F5" style="background-color: white;"></td>
            <td><input type="button" value="F6" onclick="change(this)" name="available[]" class="F6" style="background-color: white;"></td>
            <td><input type="button" value="F7" onclick="change(this)" name="available[]" class="F7" style="background-color: white;"></td>
            <td><input type="button" value="F8" onclick="change(this)" name="available[]" class="F8" style="background-color: white;"></td>
            <td><input type="button" value="F9" onclick="change(this)" name="available[]" class="F9" style="background-color: white;"></td>
            <td><input type="button" value="F10" onclick="change(this)" name="available[]" class="F10" style="background-color: white;"></td>
            <td><input type="button" value="F11" onclick="change(this)" name="available[]" class="F11" style="background-color: white;"></td>
            <td><input type="button" value="F12" onclick="change(this)" name="available[]" class="F12" style="background-color: white;"></td>
            <td><input type="button" value="F13" onclick="change(this)" name="available[]" class="F13" style="background-color: white;"></td>
            <td><input type="button" value="F14" onclick="change(this)" name="available[]" class="F14" style="background-color: white;"></td>
            <td><input type="button" value="F15" onclick="change(this)" name="available[]" class="F15" style="background-color: white;"></td>
            <td><input type="button" value="F16" onclick="change(this)" name="available[]" class="F16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>G</td>
            <td><input type="button" value="G1" onclick="change(this)" name="available[]" class="G1" style="background-color: white;"></td>
            <td><input type="button" value="G2" onclick="change(this)" name="available[]" class="G2" style="background-color: white;"></td>
            <td><input type="button" value="G3" onclick="change(this)" name="available[]" class="G3" style="background-color: white;"></td>
            <td><input type="button" value="G4" onclick="change(this)" name="available[]" class="G4" style="background-color: white;"></td>
            <td><input type="button" value="G5" onclick="change(this)" name="available[]" class="G5" style="background-color: white;"></td>
            <td><input type="button" value="G6" onclick="change(this)" name="available[]" class="G6" style="background-color: white;"></td>
            <td><input type="button" value="G7" onclick="change(this)" name="available[]" class="G7" style="background-color: white;"></td>
            <td><input type="button" value="G8" onclick="change(this)" name="available[]" class="G8" style="background-color: white;"></td>
            <td><input type="button" value="G9" onclick="change(this)" name="available[]" class="G9" style="background-color: white;"></td>
            <td><input type="button" value="G10" onclick="change(this)" name="available[]" class="G10" style="background-color: white;"></td>
            <td><input type="button" value="G11" onclick="change(this)" name="available[]" class="G11" style="background-color: white;"></td>
            <td><input type="button" value="G12" onclick="change(this)" name="available[]" class="G12" style="background-color: white;"></td>
            <td><input type="button" value="G13" onclick="change(this)" name="available[]" class="G13" style="background-color: white;"></td>
            <td><input type="button" value="G14" onclick="change(this)" name="available[]" class="G14" style="background-color: white;"></td>
            <td><input type="button" value="G15" onclick="change(this)" name="available[]" class="G15" style="background-color: white;"></td>
            <td><input type="button" value="G16" onclick="change(this)" name="available[]" class="G16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>H</td>
            <td><input type="button" value="H1" onclick="change(this)" name="available[]" class="H1" style="background-color: white;"></td>
            <td><input type="button" value="H2" onclick="change(this)" name="available[]" class="H2" style="background-color: white;"></td>
            <td><input type="button" value="H3" onclick="change(this)" name="available[]" class="H3" style="background-color: white;"></td>
            <td><input type="button" value="H4" onclick="change(this)" name="available[]" class="H4" style="background-color: white;"></td>
            <td><input type="button" value="H5" onclick="change(this)" name="available[]" class="H5" style="background-color: white;"></td>
            <td><input type="button" value="H6" onclick="change(this)" name="available[]" class="H6" style="background-color: white;"></td>
            <td><input type="button" value="H7" onclick="change(this)" name="available[]" class="H7" style="background-color: white;"></td>
            <td><input type="button" value="H8" onclick="change(this)" name="available[]" class="H8" style="background-color: white;"></td>
            <td><input type="button" value="H9" onclick="change(this)" name="available[]" class="H9" style="background-color: white;"></td>
            <td><input type="button" value="H10" onclick="change(this)" name="available[]" class="H10" style="background-color: white;"></td>
            <td><input type="button" value="H11" onclick="change(this)" name="available[]" class="H11" style="background-color: white;"></td>
            <td><input type="button" value="H12" onclick="change(this)" name="available[]" class="H12" style="background-color: white;"></td>
            <td><input type="button" value="H13" onclick="change(this)" name="available[]" class="H13" style="background-color: white;"></td>
            <td><input type="button" value="H14" onclick="change(this)" name="available[]" class="H14" style="background-color: white;"></td>
            <td><input type="button" value="H15" onclick="change(this)" name="available[]" class="H15" style="background-color: white;"></td>
            <td><input type="button" value="H16" onclick="change(this)" name="available[]" class="H16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>I</td>
            <td><input type="button" value="I1" onclick="change(this)" name="available[]" class="I1" style="background-color: white;"></td>
            <td><input type="button" value="I2" onclick="change(this)" name="available[]" class="I2" style="background-color: white;"></td>
            <td><input type="button" value="I3" onclick="change(this)" name="available[]" class="I3" style="background-color: white;"></td>
            <td><input type="button" value="I4" onclick="change(this)" name="available[]" class="I4" style="background-color: white;"></td>
            <td><input type="button" value="I5" onclick="change(this)" name="available[]" class="I5" style="background-color: white;"></td>
            <td><input type="button" value="I6" onclick="change(this)" name="available[]" class="I6" style="background-color: white;"></td>
            <td><input type="button" value="I7" onclick="change(this)" name="available[]" class="I7" style="background-color: white;"></td>
            <td><input type="button" value="I8" onclick="change(this)" name="available[]" class="I8" style="background-color: white;"></td>
            <td><input type="button" value="I9" onclick="change(this)" name="available[]" class="I9" style="background-color: white;"></td>
            <td><input type="button" value="I10" onclick="change(this)" name="available[]" class="I10" style="background-color: white;"></td>
            <td><input type="button" value="I11" onclick="change(this)" name="available[]" class="I11" style="background-color: white;"></td>
            <td><input type="button" value="I12" onclick="change(this)" name="available[]" class="I12" style="background-color: white;"></td>
            <td><input type="button" value="I13" onclick="change(this)" name="available[]" class="I13" style="background-color: white;"></td>
            <td><input type="button" value="I14" onclick="change(this)" name="available[]" class="I14" style="background-color: white;"></td>
            <td><input type="button" value="I15" onclick="change(this)" name="available[]" class="I15" style="background-color: white;"></td>
            <td><input type="button" value="I16" onclick="change(this)" name="available[]" class="I16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>J</td>
            <td><input type="button" value="J1" onclick="change(this)" name="available[]" class="J1" style="background-color: white;"></td>
            <td><input type="button" value="J2" onclick="change(this)" name="available[]" class="J2" style="background-color: white;"></td>
            <td><input type="button" value="J3" onclick="change(this)" name="available[]" class="J3" style="background-color: white;"></td>
            <td><input type="button" value="J4" onclick="change(this)" name="available[]" class="J4" style="background-color: white;"></td>
            <td><input type="button" value="J5" onclick="change(this)" name="available[]" class="J5" style="background-color: white;"></td>
            <td><input type="button" value="J6" onclick="change(this)" name="available[]" class="J6" style="background-color: white;"></td>
            <td><input type="button" value="J7" onclick="change(this)" name="available[]" class="J7" style="background-color: white;"></td>
            <td><input type="button" value="J8" onclick="change(this)" name="available[]" class="J8" style="background-color: white;"></td>
            <td><input type="button" value="J9" onclick="change(this)" name="available[]" class="J9" style="background-color: white;"></td>
            <td><input type="button" value="J10" onclick="change(this)" name="available[]" class="J10" style="background-color: white;"></td>
            <td><input type="button" value="J11" onclick="change(this)" name="available[]" class="J11" style="background-color: white;"></td>
            <td><input type="button" value="J12" onclick="change(this)" name="available[]" class="J12" style="background-color: white;"></td>
            <td><input type="button" value="J13" onclick="change(this)" name="available[]" class="J13" style="background-color: white;"></td>
            <td><input type="button" value="J14" onclick="change(this)" name="available[]" class="J14" style="background-color: white;"></td>
            <td><input type="button" value="J15" onclick="change(this)" name="available[]" class="J15" style="background-color: white;"></td>
            <td><input type="button" value="J16" onclick="change(this)" name="available[]" class="J16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>K</td>
            <td><input type="button" value="K1" onclick="change(this)" name="available[]" class="K1" style="background-color: white;"></td>
            <td><input type="button" value="K2" onclick="change(this)" name="available[]" class="K2" style="background-color: white;"></td>
            <td><input type="button" value="K3" onclick="change(this)" name="available[]" class="K3" style="background-color: white;"></td>
            <td><input type="button" value="K4" onclick="change(this)" name="available[]" class="K4" style="background-color: white;"></td>
            <td><input type="button" value="K5" onclick="change(this)" name="available[]" class="K5" style="background-color: white;"></td>
            <td><input type="button" value="K6" onclick="change(this)" name="available[]" class="K6" style="background-color: white;"></td>
            <td><input type="button" value="K7" onclick="change(this)" name="available[]" class="K7" style="background-color: white;"></td>
            <td><input type="button" value="K8" onclick="change(this)" name="available[]" class="K8" style="background-color: white;"></td>
            <td><input type="button" value="K9" onclick="change(this)" name="available[]" class="K9" style="background-color: white;"></td>
            <td><input type="button" value="K10" onclick="change(this)" name="available[]" class="K10" style="background-color: white;"></td>
            <td><input type="button" value="K11" onclick="change(this)" name="available[]" class="K11" style="background-color: white;"></td>
            <td><input type="button" value="K12" onclick="change(this)" name="available[]" class="K12" style="background-color: white;"></td>
            <td><input type="button" value="K13" onclick="change(this)" name="available[]" class="K13" style="background-color: white;"></td>
            <td><input type="button" value="K14" onclick="change(this)" name="available[]" class="K14" style="background-color: white;"></td>
            <td><input type="button" value="K15" onclick="change(this)" name="available[]" class="K15" style="background-color: white;"></td>
            <td><input type="button" value="K16" onclick="change(this)" name="available[]" class="K16" style="background-color: white;"></td>
        </tr>
        <tr>
            <td>L</td>
            <td><input type="button" value="L1" onclick="change(this)" name="available[]" class="L1" style="background-color: white;"></td>
            <td><input type="button" value="L2" onclick="change(this)" name="available[]" class="L2" style="background-color: white;"></td>
            <td><input type="button" value="L3" onclick="change(this)" name="available[]" class="L3" style="background-color: white;"></td>
            <td><input type="button" value="L4" onclick="change(this)" name="available[]" class="L4" style="background-color: white;"></td>
            <td><input type="button" value="L5" onclick="change(this)" name="available[]" class="L5" style="background-color: white;"></td>
            <td><input type="button" value="L6" onclick="change(this)" name="available[]" class="L6" style="background-color: white;"></td>
            <td><input type="button" value="L7" onclick="change(this)" name="available[]" class="L7" style="background-color: white;"></td>
            <td><input type="button" value="L8" onclick="change(this)" name="available[]" class="L8" style="background-color: white;"></td>
            <td><input type="button" value="L9" onclick="change(this)" name="available[]" class="L9" style="background-color: white;"></td>
            <td><input type="button" value="L10" onclick="change(this)" name="available[]" class="L10" style="background-color: white;"></td>
            <td><input type="button" value="L11" onclick="change(this)" name="available[]" class="L11" style="background-color: white;"></td>
            <td><input type="button" value="L12" onclick="change(this)" name="available[]" class="L12" style="background-color: white;"></td>
            <td><input type="button" value="L13" onclick="change(this)" name="available[]" class="L13" style="background-color: white;"></td>
            <td><input type="button" value="L14" onclick="change(this)" name="available[]" class="L14" style="background-color: white;"></td>
            <td><input type="button" value="L15" onclick="change(this)" name="available[]" class="L15" style="background-color: white;"></td>
            <td><input type="button" value="L16" onclick="change(this)" name="available[]" class="L16" style="background-color: white;"></td>
						<td><input type="hidden" id="str2" name="str2" value=""></td>
        </tr>


    </tbody>


    </table>
        <div style="height:30px;"></div>
        <div id='print' align="center" style="height:20px;"> 취소할 좌석을 입력해주세요. </div>

        <div align="center" style="height:40px;"><input id="seat" type="text" name="seat"></div>

        <div align="center" style="height:30px;"> <input type="submit" value="예매취소"></div>

        </form>

    </div>





</body>
</html>



     <% Connection conn;
          Statement stmt;

          try
          {
              Class.forName( "com.mysql.jdbc.Driver" );
              conn = DriverManager.getConnection( "jdbc:mysql://localhost/member_list", "root", "root1234" );
              stmt = conn.createStatement();

                ResultSet rs = stmt.executeQuery("select * from RESERVED");

                while(rs.next()){
                    if(rs.getString("movie").equals(movie) && rs.getString("start_time").equals(start)){
                    if(rs.getString("member_id").equals(session.getAttribute("id"))){
                    %>
                    <script>
                    change_user_reserved("<%=rs.getString("seat_no")%>");
                    </script>

                    <%
                       }
                    else{
                       %>
                    <script>
                    change_reserved("<%=rs.getString("seat_no")%>");
                    </script>

                    <%

                       }
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
