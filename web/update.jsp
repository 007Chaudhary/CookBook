<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/recipe";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String id=request.getParameter("id");
String post_title=request.getParameter("title");
String post_author=request.getParameter("author");
String post_desc=request.getParameter("desc");
String ingredients=request.getParameter("ingredients");
String recipe=request.getParameter("recipe");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update new_recipe set id=?,post_title=?,post_author=?,post_desc=?,ingredients=?,recipe=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, post_title);
ps.setString(3, post_author);
ps.setString(4, post_desc);
ps.setString(5, ingredients);
ps.setString(6, recipe);
int i = 0;
i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("view.jsp?view="+i);
}
else
{
response.sendRedirect("view.jsp?view="+i); 
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>