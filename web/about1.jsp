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
                            <li class="page_item page-item-2">
                                
                                            <a href="about1.jsp" target="_self">
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
    h1{
        color: #99ff99;
    }
    
    pre {
        background: #ccffff; 
        font-size: 15px;
        text-align: justify;
    }
</style>
<div class="col-md-8" >
                
    <h1 >Introduction:</h1>
            <pre >  
Cooking is one of the most talented work. For some of them cooking is hobbies and for some of them it is time pass.
Preparing new items are experimental one only few them exist in the previous 
time. but now every one was trying in preparing new items irrespective of region and country.
And for some of them cooking is business where they can maintain hotel or 
restaurant.
And for some of them likes to tasting a different kind of food items.
And for all kinds of people above need to do manually work to know about the 
preparation of new food items and to people who want to try new items and also 
who want to taste different items.
</pre>
    <h1>Abstract:</h1>
    <pre>
The manually work is the these people have to get knowledge or information from 
different kind of sources like books, people, etc. But these is very difficult to find out answers for queries of about their issues.
So from this Cooking Recipe Management System project we are giving ultimate 
solution for all of them that is we are making website where each and every one 
check and see the website.
This website don?t required any username and password. so every one can see the website and our website is contain about all the food items with irrespect of the region or country.
All kind of items are displayed on the websites. so our website is open for 
any one with irrespect of country and region.
To resolve the issues of the previous things we are not  providing any 
restriction for the user to see website.</pre>
<h1>EXISTING SYSTEM:</h1>
<pre>
The present system is all about manually displaying or publishing the 
cookie recipes.
In previous people use to display the cooking items in the newspapers, books, 
magazines etc.
If they want to know about any new items then they used to search books, 
articles, newspaper and ask others.
As these will be manually and people use to face difficultly in sharing their
information.
The sharing of the cookie items makes the problems for common people, business, 
hotels also.</pre>

                    <div class="clearfix">
                    </div>
                </div>

         <%@include file="includes/footer.jsp" %>
