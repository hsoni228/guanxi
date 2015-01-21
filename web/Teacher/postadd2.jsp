<%-- 
    Document   : marksadd2
    Created on : 25 Mar, 2014, 1:30:38 AM
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
          String user=(String)session.getAttribute("user");
          String utype=(String)session.getAttribute("type");
          String text=request.getParameter("text1");
          out.println(user+" "+utype);
          String section=(String)session.getAttribute("sec");
          if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String sql="insert into posttable"+" values('"+user+"','"+text+"')";
           Statement s = c.createStatement();
           s.executeUpdate(sql);
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
