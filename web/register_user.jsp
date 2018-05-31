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
<script>
    	function signup() {
		var clear = "";
		var e = document.getElementById("email").value;
		var atpos = e.indexOf("@");
		var dotpos = e.lastIndexOf(".");
		if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= e.length) {
			window.alert("Not a valid E-Mail Address");
			document.getElementById("s3").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Not a valid E-Mail Address";
			document.getElementById("s3").style.color = "Red";
			document.getElementById("pass").value = clear;
			document.getElementById("c_pass").value = clear;
			document.getElementById("email").style.backgroundColor = "Red";
		}

		var m = document.getElementById("pass").value;
		var n = document.getElementById("c_pass").value;

		//if passwords do not match
		if (m.length >= 1 && n.length >= 1 && m != n) {
			window.alert("Your Password Does Not Match the Repeat Password.");
			document.getElementById("s3").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Your Password Does Not Match the Repeat Password.";
			document.getElementById("s3").style.color = "Red";
			document.getElementById("pass").value = clear;
			document.getElementById("c_pass").value = clear;
			document.getElementById("pass").style.backgroundColor = "Red";
			document.getElementById("c_pass").style.backgroundColor = "Red";
		}
                                    
                                    var m = document.getElementById("email").value;
		var n = document.getElementById("c_email").value;
                                    
                                    if (m.length >= 1 && n.length >= 1 && m != n) {
			window.alert("Your Password Does Not Match the Repeat Password.");
			document.getElementById("s3").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Your Password Does Not Match the Repeat Password.";
			document.getElementById("s3").style.color = "Red";
			document.getElementById("pass").value = clear;
			document.getElementById("c_pass").value = clear;
			document.getElementById("pass").style.backgroundColor = "Red";
			document.getElementById("c_pass").style.backgroundColor = "Red";
		}
                
                                    

		//assuming passwords do match
		//minimum length of password must be 6 characters
		if (m == n && m.length >= 1 && n.length >= 1 && m.length < 6 && n.length < 6) {
			window.alert("Password's Length is Too Short.");
			document.getElementById("s3").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;*Password's Length is Too Short. Passwords should contain at least min. of 6 characters.";
			document.getElementById("s3").style.color = "Red";
			document.getElementById("pass").value = clear;
			document.getElementById("c_pass").value = clear;
			document.getElementById("pass").style.backgroundColor = "Red";
			document.getElementById("c_pass").style.backgroundColor = "Red";
		}
	}

</script>

<style>
    td {
       color: #00ff08; 
       font-size: 16px;
       padding-bottom: 25px;
    }
</style>
 
<div class="col-md-8">
 
    <form action="registered.jsp" method="post" id="form1" name="reg">
        <table style="border: 0;">
						<tr>
							<th colspan="6" align="center">
                                                <center style="color: #00fff3; font-size: 35px;">Register Here!</center>
							</th>
						</tr>
                                                <tr>
                                                    <td colspan="6">&nbsp</td>
                                                </tr>
						<tr>
							<td align="right">First Name:</td>
							<td><input type="text" name="f_name" placeholder="First Name!" required></td>
							<td align="right">Last Name:</td>
							<td><input type="text" name="l_name" placeholder="Last Name!" required></td>
						</tr>
						<tr>
							<td align="right">E-Mail:</td>
							<td><input type="email" name="email" placeholder="E-Mail!" required></td>
							<td align="right">Re-Type E-Mail:</td>
							<td><input type="email" name="c_email" placeholder="Re-Type E-Mail!" required></td>
						</tr>
						<tr>
							<td align="right">Password:</td>
							<td><input type="password" name="pass" placeholder="Password!" required></td>
							<td align="right">Re-Type Password:</td>
							<td><input type="password" name="c_pass" placeholder="Re-Type Password!" required></td>
						</tr>
						<tr>
							<td align="right">Username:</td>
							<td><input type="text" name="u_name" placeholder="Username!" required></td>
							<td align="right">Address:</td>
							<td><input type="text" name="address" placeholder="Address!" required></td>
						</tr>
						<tr>
							<td align="right">City</td>
							<td><input type="text" name="city" placeholder="City!" required></td>
							<td align="right">State</td>
							<td><input type="text" name="state" placeholder="State!" required></td>
						</tr>
						<tr>
							<td align="right">Country:</td>
							<td><input type="text" name="country" placeholder="Country!" required></td>
							<td align="right">Gender:</td>
                                                        <td id="gen" style="color: black;"><select name="gender" id="select">
								<option>I am...</option>
								<option name="male" required >Male</option>
								<option name="female" required >Female</option>
								</select></td>
						</tr>
						<tr>
							<td align="right">Post Office:</td>
							<td><input type="text" name="p_o" placeholder="Post Office!" required></td>
							<td align="right">Date of Birth:</td>
							<td>
								<input type="text" name="date_of_birth" placeholder="e.g.:DD/MM/YYYY" required></td>
						</tr>
                                                <tr >
                                                    <td align="center" colspan="3" style="color: black;">
                                                <center><input type="reset" value="Clear" name="clear"></center>
                                                    </td>
							<td align="center" colspan="3" style="color: black;">
                                                        <center><input type="submit" value="Register" name="submit" onclick="signup()"></center>
							</td>
						</tr>
					</table>
        <span id="s3"></span>
</form>
<div class="clearfix">
                    </div>
    
</div>


         <%@include file="includes/footer.jsp" %>