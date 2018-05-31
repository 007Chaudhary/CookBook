<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("email");   
        String password = request.getParameter("pass");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/recipe?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select email,pass,f_name from users where email=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();   
        
        if(rs.next())   
        {
            session.setAttribute("username", username);
            response.sendRedirect("recipe.jsp"); 
        }
        else
           response.sendRedirect("error_login.jsp");        
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>