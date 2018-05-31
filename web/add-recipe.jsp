<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%! String url = "jdbc:mysql://localhost:3306/recipe";%>
<%! String user = "root";%>
<%! String psw = "root";%>
<%
String post_title=request.getParameter("title");
String post_author=request.getParameter("author");
String post_desc=request.getParameter("desc");
String ingredients=request.getParameter("ingredients");
String recipe=request.getParameter("recipe");
String image=request.getParameter("image");
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName).newInstance();
con = DriverManager.getConnection(url,user,psw);
ps = con.prepareStatement("INSERT INTO new_recipe(post_title,post_author,post_desc,ingredients,recipe,post_image) VALUES (?,?,?,?,?,?)");
ps.setString(1, post_title);
ps.setString(2, post_author);
ps.setString(3, post_desc);
ps.setString(4, ingredients);
ps.setString(5, recipe);
ps.setString(6, image);
int i = 0;
i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("view.jsp");
}
else
{
response.sendRedirect("new.jsp"); 
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>