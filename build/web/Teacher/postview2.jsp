<%-- 
    Document   : postview2
    Created on : 26 Mar, 2014, 12:54:31 AM
    Author     : Himanshu Soni
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%
          try
          { 
          String user=(String)session.getAttribute("user");
          String utype=(String)session.getAttribute("type");
          String text=request.getParameter("text1");
          out.println(user+" "+utype);
         
          if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          String postid=request.getParameter("post");
         // out.println("postid "+postid);
          Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
         String sql1="Select post from posttable where postid='"+postid+"'";
          //out.println(sql1);
          Statement s1 = c.createStatement();
          //out.println(user); 
          ResultSet rs1=s1.executeQuery(sql1);
          rs1.next();
           {
               out.println("<br>"+rs1.getString(1)+"<br>");
           }
          
          
          
          String sql="Select * from commenttable where postid='"+postid+"'";
         // out.println(sql);
          Statement s = c.createStatement();
          //out.println(user); 
          ResultSet rs=s.executeQuery(sql);
         // out.println("Hello");
          
          
          while(rs.next())
           {
               out.println("<br>"+rs.getString(2)+"<br>"+rs.getString(3)+"<br>");
           }
       }
             catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }  
            %>
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>
