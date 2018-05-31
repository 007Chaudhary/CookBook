<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


        <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
        <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
        <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
        <% Class.forName("com.mysql.jdbc.Driver"); %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/base.css">
        <link rel="stylesheet" type="text/css" href="css/editor-style.css">
        <link rel="stylesheet" type="text/css" href="css/media.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <title>FOOD &AMP; RECIPIES</title>
    </head>
    <body background="images/bg2.jpg" size="auto">
        <header>
            <div class="foodrecipes-container-recipes container">
                <div class="col-md-12 foodrecipes-heading-title no-padding">
                    
                    <div class="col-md-3 foodrecipes-logo">
                        <a href="index.jsp" target="_self">
                            <img src="images/logo.png"  class="foodrecipes-custom-header" alt="">
                        </a>
                    </div>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle navbar-toggle-top" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar foodrecipes-icon-color"></span>
                            <span class="icon-bar foodrecipes-icon-color"></span>
                            <span class="icon-bar foodrecipes-icon-color"></span>
                        </button>
                    </div>
                    <div class="col-md-6 no-padding food-clear">
                        <ul class="navbar-collapse collapse menu-foodrecipes">
                            <li class="page_item page-item-2">
                                
                                <a href="index.jsp" target="_self">
                                    Home
                                </a>
                                       
                            </li>
                            
                                <li class="page_item page-item-2">
                                
                                <a href="register_user.jsp" target="_self">
                                    Register
                                </a>
                                  
                            </li>
                            <li class="page_item page-item-2">
                                <a href="login_user.jsp" target="_self">
                                    Login
                                </a>
                            </li>
                            <li class="page_item page-item-2">
                               
                                <a href="contact.jsp" target="_self">
                                    Contact
                                </a>
                                       
                            </li>
                            <li class="page_item page-item-2">
                                
                                            <a href="about.jsp" target="_self">
                                    About
                                </a>
                                     
                            </li>
                        </ul>
                    </div>
                                <div class="col-md-3" style="padding: 20px; font-size: 20px; color: #00fff3; text-align: right;">
                                    
                                    <%
                                        if (session.getAttribute("username") == null )
                                            out.println("Please Login!!");
                                        else
                                            out.println(session.getAttribute("username"));
                                            %>
        
                                </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </header>
                                            
                                            <div class="container foodrecipes-container-recipes foodrecipes-main-template">
    <div class="col-md-12 foodrecipes-bg">
<style>
    td {
       color: #00ff08; 
       font-size: 16px;
       padding-bottom: 25px;
    }
</style>
 
<div class="col-md-8">
    <br><br><br><br><br><br><br><br>
    <form action="validate.jsp" method="post" id="form2">
					<table>
						<tr>
							<td colspan="6" align="center">
							 <center style="color: #00fff3; font-size: 35px;">Login Here!</center>
							</td>
						</tr>
						<tr>
							<td>E-Mail:</td>
							<td><input type="email" name="email" placeholder="E-Mail!" required></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="pass" placeholder="Password!" required></td>
						</tr>
                                                <tr>
                                                    <td colspan="6">
                                                        &nbsp;
                                                    </td>
                                                </tr>
						<tr>
							<td align="center" colspan="3" style="color: black;">
                                                <center><button type="submit" name="login" id="btn2" onclick="login()">Login!</button></center>
							</td>
						</tr>
					</table>
        <span id="p1"></span>
				</form>
     
</div>

   
<script>
    function login() {
    var k = document.getElementById("email").value;
    var l = document.getElementById("pass").value;
    var clearall = "";
	if ( k=="" || l=="") {
		window.alert("Username or Password Field Empty");
		document.getElementById("p1").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Username or Password Field Empty";
		document.getElementById("pass").style.backgroundColor = "Red";
		document.getElementById("email").style.backgroundColor = "Red";
	}
    else if (k.length < 6) {
        window.alert("Please Enter a Valid Username");
        document.getElementById("p1").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Please Enter a Valid Username";
        document.getElementById("email").style.backgroundColor = "Red";
		document.getElementById("pass").style.backgroundColor = "PaleGreen";
    }
    if (k.length >= 6 && l.length < 6) {
        window.alert("Please Enter a Valid Password");
        document.getElementById("p1").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Please Enter a Valid Password";
        document.getElementById("email").style.backgroundColor = "PaleGreen";
        document.getElementById("pass").style.backgroundColor = "Red";

    }
}
    </script>
        
         <%@include file="includes/footer.jsp" %>