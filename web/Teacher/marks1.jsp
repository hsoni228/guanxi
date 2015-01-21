<%-- 
    Document   : attendence
    Created on : 15 Mar, 2014, 1:51:46 AM
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
    <%
    try
       { 
           Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String user=(String)session.getAttribute("user");
          String utype=(String)session.getAttribute("type");
          out.println(user+" "+utype);
         
          if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
                 
           String sql="SELECT year,sub,section FROM attendenceteacher WHERE user='"+user+"'";
           Statement s = c.createStatement();
             ResultSet rs=s.executeQuery(sql);
   int count=1;
   out.println("<form action='marks.jsp' method='post'><center><table><tr><th>S_No.</th><th>Year</th><th>Subject</th><th>Section</th></tr>");
   while(rs.next())
      {String tablename=rs.getString(1).charAt(0)+rs.getString(3)+rs.getString(2);
           out.println("<tr><td>"+count+"</td><td><input type='hidden' name='year' value='"+rs.getString(1)+"'>"+rs.getString(1)+"</td>"+"</td><td><input type='hidden' name='sub' value='"+rs.getString(2)+"'>"+rs.getString(2)+"</td>"+"</td><td><input type='hidden' name='sec1' value='"+rs.getString(3)+"'>"+"<input type='radio' name='sec' value='"+tablename+"'>"+rs.getString(3)+"</td><tr>"); 
          //out.println(""+count+""+rs.getString(1)+"\t"+rs.getString(2));
           //out.println("<BR>"); 
      count++;
       //rs.next();
      }
   out.println("<input type='submit' value='submit'>");
       }
    catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }
%>
<style>
    table,tr
{
border:3px solid black;
padding:15px;
}
th
{
background-color:black;
color:white;
width:200px;
font-size:200%;
}
td
{
border:2px solid brown;
padding:15px;
text-align:center;
font-size:150%;
font-weight:bold;
}
</style>
    <body>
        <h1>Hello <% String user=(String)session.getAttribute("user");out.println(user);%> !</h1>
    </body>
</html>
