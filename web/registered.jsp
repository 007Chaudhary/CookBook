<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%! String url = "jdbc:mysql://localhost:3306/recipe";%>
<%! String user = "root";%>
<%! String psw = "root";%>
<%
    String f_name = request.getParameter("f_name");
    String l_name = request.getParameter("l_name");
    String email = request.getParameter("email");
    String c_email = request.getParameter("c_email");
    String pass = request.getParameter("pass");
    String c_pass = request.getParameter("c_pass");
    String u_name = request.getParameter("u_name");
    String address = request.getParameter("address");
    String date_of_birth = request.getParameter("date_of_birth");
    String city = request.getParameter("city");
    String gender = request.getParameter("gender");
    String country = request.getParameter("country");
    String state = request.getParameter("state");
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName).newInstance();
con = DriverManager.getConnection(url,user,psw);
ps = con.prepareStatement("INSERT INTO users (f_name, l_name, email, c_email, pass, c_pass, u_name, address, date_of_birth, city, gender, country, state) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, f_name);
ps.setString(2, l_name);
ps.setString(3, email);
ps.setString(4, c_email);
ps.setString(5, pass);
ps.setString(6, c_pass);
ps.setString(7, u_name);
ps.setString(8, address);
ps.setString(9, date_of_birth);
ps.setString(10, city);
ps.setString(11, gender);
ps.setString(12, country);
ps.setString(13, state);
int i = 0;
i = ps.executeUpdate();
if(i > 0)
{
response.sendRedirect("login_user.jsp");
}
else
{
response.sendRedirect("register_user.jsp"); 
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
%>