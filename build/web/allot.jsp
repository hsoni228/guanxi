<%-- 
    Document   : allot
    Created on : Mar 28, 2014, 3:27:36 AM
    Author     : KUNALK
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String user=request.getParameter("user");
          String year=request.getParameter("year");
          String sec=request.getParameter("sec");
          String sub=request.getParameter("sub");
          String sql1="insert into attendenceteacher values('"+user+"','"+year+"','"+sub+"','"+sec+"'";
          Statement s1 = c.createStatement();
          s1.executeUpdate(sql1);
          
        %>
    <body>       
        <h1>Hello World!</h1>
    </body>
</html>
