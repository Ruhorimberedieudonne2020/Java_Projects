<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration</title>
    </head>
    <body>         
 <%
    String username = request.getParameter("fname");       
    String Email = request.getParameter("email");
    String Pass = request.getParameter("password");
  
  

 try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
           Statement st=conn.createStatement();
 
       int i= st.executeUpdate("insert into  registration (username,email,password) values(username,Email,Pass)");
        out.println("Data is successfully inserted!");
}
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        } 
%>

    </body>
</html>

