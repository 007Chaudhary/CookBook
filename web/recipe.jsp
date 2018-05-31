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

        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/recipe"
         user = "root"  password = "root"/>
      
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from new_recipe order by 1 DESC LIMIT 0,100;
      </sql:query>
        
        <div class="col-md-8">
                    <c:forEach var = "row" items = "${result.rows}">
                    
                    <div class="masonry-container masonry">
                        
                        <div class="col-md-5 box masonry-brick foodrecipes-post-box-margin no-padding" style="margin-right: 20px;">
                            <div class="article" style="margin: 0px">
                                <div class="foodrecipes-post-box">
                                    <div class="foodrecipes-post-box-img" style="height: 276px;">
                                        <span class="img-responsive">
                                            <img src="uploads/<c:out value = "${row.post_image}"/>" style="height: 276px;">
                                        </span>
                                        <a href="page.jsp?id=<c:out value = "${row.id}"/>" target="_self">
                                            <div class="foodrecipes-post-box-hover">
                                                <div class="foodrecipes-post-box-hover-center">
                                                    <div class="foodrecipes-post-box-hover-center1">
                                                        <i class="foodrecipes-zoom-icon"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div class="foodrecipes-box-name">
                                        <h6>
                                            <c:out value = "${row.post_date}"/>
                                        </h6>
                                        <div class="foodrecipes-title">
                                            <a href="page.jsp?id=<c:out value = "${row.id}"/>" target="_self">
                                                <c:out value = "${row.post_title}"/>
                                            </a>
                                        </div>
                                        <div class="foodrecipes-hr">
                                            Post By: 
                                            <span class="foodrecipes-postby-color" style="font-size: 12px;">
                                                
                                                    <c:out value = "${row.post_author}"/>
                                               
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                      
                                               
                                                
                    </div>
                        </div>
                                                 </c:forEach>
                    <div class="clearfix">
                    </div>
                </div>
        
         <%@include file="includes/footer.jsp" %>
