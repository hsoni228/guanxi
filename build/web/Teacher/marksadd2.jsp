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
          String table=(String)session.getAttribute("table");
          out.println(user+" "+utype);
         
          if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          String roll=request.getParameter("roll");
          String name=request.getParameter("name");
          String sessional1=request.getParameter("sessional1");
          String sessional2=request.getParameter("sessional2");
          String attendence=request.getParameter("attendence");
          String internal=request.getParameter("internal");
          String fina=request.getParameter("final");
          Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String sql="insert into "+table+" values('"+roll+"','"+name+"','"+sessional1+"','"+sessional2+"','"+attendence+"','"+internal+"','"+fina+"')";
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
