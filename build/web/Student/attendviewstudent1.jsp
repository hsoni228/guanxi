<%-- 
    Document   : attendviewstudent1
    Created on : 27 Mar, 2014, 12:37:55 AM
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
          if(user==null || utype.equals("student")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
           String sql="select rollno,year,section from loginstudent where user='"+user+"'";
           Statement s = c.createStatement();
           ResultSet rs=s.executeQuery(sql);
           rs.next();
           String rollno=(String)session.getAttribute("rollno");
           String tablename=request.getParameter("sec");
           String sql1="SELECT Count(*) FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'attend"+tablename+"'";
            Statement s1 = c.createStatement();
            ResultSet rs1=s1.executeQuery(sql1);
            rs1.next();
             int count=rs1.getInt(1);
             out.println(""+count+" "+rollno+" "+tablename);
           String sql2="select * from attend"+tablename+" where rno='"+rollno+"'";
           Statement s2 = c.createStatement();
           ResultSet rs2=s2.executeQuery(sql2);
           //out.println("<form action='attendviewstudent1.jsp' method='post'><center><table class='tsc_table_s9' summary='Sample Table' style='width:80%;'><thead><tr><th>S No.</th><th>Year</th><th>Subject</th><th>Section</th></tr></thead><tfoot><tr><th scope='row'>Total</th><td colspan='7'>4 buildings</td></tr></tfoot><tbody>");
           int i=2;
           while(rs2.next())
           {
               String sub=rs1.getString(1);
               //out.println("sub "+sub);
                    //out.println("<tr class='odd'><td>"+count+"</td><td><input type='hidden' name='year' value='"+year+"'>"+year+"</td>");
                    //out.println("<td><input type='hidden' name='sub' value='"+sub+"'>"+sub+"</td>");
                    //out.println("<td><input type='hidden' name='sec1' value='"+sec+"'>"+"<input type='radio' id='radio"+count+"' name='sec' value='"+tablename+"'><label for ='radio"+count+"'>"+sec+"</label></input></td><tr>"); 
                while(i<=count)
                {
                    out.println(""+rs2.getString(i));
                    i++;
                }
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
