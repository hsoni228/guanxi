<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>File Uploading Form</title>
</head>
<body>
<h3>File Upload:</h3>

<%
    try
       { 
           Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String user=(String)session.getAttribute("user");
          String utype=(String)session.getAttribute("type");
          out.println(user+" "+utype);
         String year1=request.getParameter("year");
          String sub1=request.getParameter("sub");
          String sec1=request.getParameter("sec1");
          String sec=request.getParameter("sec");
          String rollno=(String)session.getAttribute("rollno");
           String tablename=request.getParameter("sec");
           session.setAttribute("rollno",rollno );
           session.setAttribute("sec", tablename);
          if(user==null || utype.equals("student")==false)
          {
        String site ="http://localhost:8080/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          
       }
          catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }

%>
Select a file to upload: <br />
<form action="fileuploadstudent2.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</body>
</html>
