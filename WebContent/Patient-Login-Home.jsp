<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientLoginHome.css"> </link>
<script type="text/javascript" src="PatientLoginHome.js"> </script>
</head>
<body topmargin="0" leftmargin="0">

<jsp:include page="PatientHeader.jsp"></jsp:include>

<div class="slider">
    <div class="slides">
        <input type="radio" name="radio-btn" id="radio1">
        <input type="radio" name="radio-btn" id="radio2">
        <input type="radio" name="radio-btn" id="radio3">
        <input type="radio" name="radio-btn" id="radio4">
        <div class="slide first">
            <img src="01.png">
        </div>
        <div class="slide">
            <img src="02.jpg">
        </div>
        <div class="slide">
            <img src="03.jpg">
        </div>
        <div class="slide">
            <img src="04.jpg">
        </div>
        <div class="navigation-auto">
            <div class="auto-btn1"></div>
            <div class="auto-btn2"></div>
            <div class="auto-btn3"></div>
            <div class="auto-btn4"></div>
        </div>
    </div>
    <div class="navigation-manual">
        <label for="radio1" class="manual-btn"></label>
        <label for="radio2" class="manual-btn"></label>
        <label for="radio3" class="manual-btn"></label>
        <label for="radio4" class="manual-btn"></label>
    </div>
</div>
<div class="part1">
    <table>
        <tr>
            <td rowspan="5" class="home1"> <img src="Home1.jpg" width="824" height="550"> </td>
            <td style="vertical-align: bottom;"> <h1> Intelligent Hospital Systems </h1> </td>
        </tr>
        <tr>
            <td style="line-height: 22px;"> 
                Intelligent hospital is an application which is developed to retrieve patient's details easily. In this 
                application doctor directly collects all the information of the patient regarding the disease like patient 
                name, age, gender, B.P, weight blood test, urine test place and the description of the disease. Doctor can 
                analyze the disease of the patient easily with in no time with this information. Doctor can search the symptoms 
                and find the cure to the disease easily. Depending on the result found related to patients symptoms doctor will 
                prescribe medicines to the patient. When doctor finds new symptoms he can add the related information in the 
                database which he can analyze the same disease in future without any waste of time. Doctor can view the graph 
                which shows the level of various disease in various locations.
            </td>
        </tr>
        <tr>
            <td style="text-align: center;"> <a href="Patient-About.jsp"> <button class="know"> Know More </button> </a> </td>
        </tr>
    </table>
</div>

<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>