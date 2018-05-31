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
    }
</style>

        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/recipe"
         user = "root"  password = "root"/>
      
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from new_recipe order by 1 DESC;
      </sql:query>
        
        <div class="col-md-8">
            
            <%
            if( Boolean.parseBoolean(request.getParameter("view")) )
            {
                if ( Integer.parseInt(request.getParameter("view")) > 0 )
                {
                    out.println("Update Was SuccesFul!!");
                }
                else
                    out.println("There was some problem.. please try AGAIN!! ....:)");
            }   
                %>
            
            <table align="center" style="margin:0 auto; width:100%; padding-left:15px; background: #00ff08">
	<tr>
       <td colspan="9" bgcolor="orange"> <center><h1>View All Posts</h1></center></td>
	</tr>
	<tr align="center">
		<th>Post No:</th>
		<th>Title</th>
		<th>Date</th>
		<th>Author</th> 
		<th>Image</th>
		<th>Content</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
        <%
        int i=1;
        %>
                    <c:forEach var = "row" items = "${result.rows}">
                    
                        <tr align="center">
		<td><%=i++ %></td>
		<td><c:out value = "${row.post_title}"/></td>
		<td><c:out value = "${row.post_date}"/></td>
		<td><c:out value = "${row.post_author}"/></td>
		<td><img src="uploads/<c:out value = "${row.post_image}"/>" width="50" height="50"></td>
                                    <c:set var = "string1" value = "${row.post_desc}"/>
                                    <c:set var = "string2" value = "${fn:substring(string1, 0, 30)}" />
		<td>${string2}</td>
		<td><a href="edit.jsp?id=<c:out value = "${row.id}"/>" style="text-decoration:none; color:#6c5b37;">Edit</a></td>
		<td><a href="delete.jsp?del=<c:out value = "${row.id}"/>" style="text-decoration:none; color:#6c5b37;">Delete</a></td>
	</tr>
                  
                                                 </c:forEach>
            </table>
                    <div class="clearfix">
                    </div>
        </div>
        
         <%@include file="includes/footer.jsp" %>