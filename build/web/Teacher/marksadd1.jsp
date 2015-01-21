<%-- 
    Document   : markadd
    Created on : Mar 23, 2014, 12:49:21 PM
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
          out.println(user+" "+utype);
         
          if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          String table=request.getParameter("sec");
          session.setAttribute("table",table);
       }
             catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }  
            %>
        <form action="marksadd2.jsp" method="post">
        Roll No:<input type="text" name="roll" id="roll"><br>
        Name:<input type="text" name="name" id="name"><br>
        Sessional 1:<input type="text" name="sessional1" id="sess1"><br>
        Sessional 2:<input type="text" name="sessional2" id="sess2"><br>
        Attendence:<input type="text" name="attendence" id="attendence"><br>
        Internal :<input type="text" name="internal" id="final"><br>
        Final :<input type="text" name="final" id="final"><br>
        <input type="submit" id="submit">
        </form>
    </body>
</html>
