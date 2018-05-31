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

        

        <div class="col-md-8">
           <%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "recipe";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from new_recipe where id = '" + id + "'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<center style="font-size: 30px; color: #00ff5a"><b><%=resultSet.getString("post_title") %></b></center><br>     <br> <br>
<center><img src="uploads/<%=resultSet.getString("post_image") %>" /></center>
<p style="font-size: 15px; color: #ffef00">Published On:&nbsp; &nbsp;<b><%=resultSet.getString("post_date") %></b></p><br>

<pre align="justify" style="background: #8ed4cc; font-size: 18px;"><%=resultSet.getString("post_desc") %></pre>
<pre align="justify" style="background: #b1f6ee; font-size: 17px;"><b>Ingredients Requires:-</b><br><%=resultSet.getString("ingredients") %></pre>

<pre align="justify" style="background: #b1f6ee; font-size: 17px;"><b>Steps:-</b><br><%=resultSet.getString("recipe") %></pre>
<p align="right" style="font-size: 15px; color: #ffef00">Posted By: &nbsp; &nbsp;<b><%=resultSet.getString("post_author") %></b></p>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
            
            </div>
        
<%@include file="includes/footer.jsp" %>