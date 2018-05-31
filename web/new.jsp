<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if ( session.getAttribute("username") == null || session.getAttribute("username") == "" )
        response.sendRedirect("login_user.jsp");
%>

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
                        <a href="recipe.jsp" target="_self">
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
                                
                                <a href="recipe.jsp" target="_self">
                                    Home
                                </a>
                                       
                            </li>
                            
                                <li class="page_item page-item-2">
                                
                                <a href="view.jsp" target="_self">
                                    View
                                </a>
                                  
                            </li>
                            <li class="page_item page-item-2">
                                <a href="new.jsp" target="_self">
                                    New Recipe
                                </a>
                            </li>
                            <li class="page_item page-item-2">
                                <a href="logout.jsp" target="_self">
                                    Logout
                                </a>
                            </li>
                            <li class="page_item page-item-2">
                               
                                <a href="contact1.jsp" target="_self">
                                    Contact
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
    td, tr {
        text-align: center;
        padding-leftt: 2px;
        padding-right: 2px;
        padding-bottom: 4px;
        padding-top: 4px;
    }
    
    #id2 {
        text-align: right;
                font-size: 15px;
        color: #ffef00;
    }
</style>        
        <div class="col-md-8">
            
                   
            <form method="get" action="add-recipe.jsp" class="form3">

<table align="center" style="text-align: center; margin:0 auto; width:100%; padding-left:15px;">
	<tr>
		<td align="center" colspan="5" bgcolor="orange">
		<h1>Insert New Recipe Here!</h1></td>
	</tr>
	<tr>
		<td align="right" id="id2">Recipe Title:</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td align="right" id="id2">Recipe Author:</td>
		<td><input type="text" name="author"></td>
	</tr>
	<tr>
		<td align="right" id="id2">Recipe Image:</td>
                <td><center><input type="file" name="image"></center></td>
	</tr>
	<tr>
		<td align="right" id="id2">Recipe Description:</td>
		<td><textarea name="desc" cols="29" rows="10"></textarea></td>
	</tr>
                    <tr>
		<td align="right" id="id2">Recipe Ingredients:</td>
		<td><textarea name="ingredients" cols="29" rows="10"></textarea></td>
	</tr>
                    <tr>
		<td align="right" id="id2">Recipe:</td>
		<td><textarea name="recipe" cols="29" rows="10"></textarea></td>
	</tr>
	<tr>
		
		<td align="center" colspan="5">
		<input id="btn3" type="submit" name="submit" value="Publish Now">Publish Now</button></td>
	</tr>
</table>
</form>
            
            
            
                    <div class="clearfix">
                    </div>
                </div>
                
         <%@include file="includes/footer.jsp" %>