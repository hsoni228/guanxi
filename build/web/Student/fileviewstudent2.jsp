<%-- 
    Document   : attendviewstudent
    Created on : 26 Mar, 2014, 11:21:59 PM
    Author     : Anirudh
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try
       { 
           Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String user=(String)session.getAttribute("user");
          String utype=(String)session.getAttribute("type");
          String table=request.getParameter("sec");
          if(user==null || utype.equals("student")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          
           String sql="select filepath from file"+table+" where type='teacher'";
           Statement s = c.createStatement();
           ResultSet rs=s.executeQuery(sql);
           int count=1;
           while(rs.next())
           {
               String path=rs.getString(1);
               out.println(count+" "+path+"<br>"); 
               count++;
           }
           //out.println("<input type='submit' value='Submit'>");
          }
    catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }
%>
       
        <h1>Hello World!</h1>
    </body>
</html>
