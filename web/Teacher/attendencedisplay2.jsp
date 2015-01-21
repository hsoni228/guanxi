<%-- 
    Document   : attendence2
    Created on : Mar 21, 2014, 6:57:22 PM
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
          String year1=request.getParameter("year");
          String sub1=request.getParameter("sub");
          String sec1=request.getParameter("sec1");
          String sec=request.getParameter("sec");
          String sql="SELECT fname,lname FROM loginteacher where user='"+user+"'";
           Statement s = c.createStatement();
             ResultSet rs=s.executeQuery(sql);
             rs.next();
             String name=rs.getString(1)+" "+rs.getString(2);
out.println("<bar><abc>"+name+"</abc><pqr>"+year1+" Year</pqr><xyz>"+sec1+"</xyz><mno>"+sub1+"</mno></bar>");          
//out.println(user+"<br>"+utype+"<br>"+year1+"<br>"+section+"<br>"+subject);
          if(user==null || utype.equals("teacher")==false || sec==null)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
         String sql1="SELECT Count(*) FROM INFORMATION_SCHEMA.Columns where TABLE_NAME = 'attend"+sec+"'";
         Statement s1 = c.createStatement();
         ResultSet rs1=s1.executeQuery(sql1);
         rs1.next();
         int count=rs1.getInt(1);
         out.println(count);
         String sql2="select * from attend"+sec1+sub1+"";
         Statement s2 = c.createStatement();
         ResultSet rs2=s2.executeQuery(sql2);
         out.println("Thank God ");
             while(rs2.next()){
                 int j=1;
                 out.println("Thank God ");
                 while(j<=count)
                 {
                     out.println("Thank God ");
                     out.println("<input type='text' readonly>"+rs2.getString(j)+"<br>");
                     j++;
                 }
             }
             }
    catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }  
    %>
    <style>
bar
{
    display:block;
    background-color:orange;
    border-radius: 12px;
    width:100%;
    height:170px;
    margin-bottom: 30px;
}
mark
{
    display:block;
    background-color:maroon;
    border-radius: 6px;
    width:250px;
    text-align: center;
    color:yellow;
    font-size: 40px;
    position: absolute;
    left:550px;
    top:25px;
}
abc
{
    display:block;
    background-color:maroon;
    border-radius: 6px;
    width:250px;
    text-align: center;
    color:yellow;
    font-size: 40px;
    position: absolute;
    left:30px;
    top:95px;
}
pqr
{
    display:block;
    background-color:maroon;
    border-radius: 6px;
    width:180px;
    text-align: center;
    color:yellow;
    font-size: 40px;
    position: absolute;
    left:350px;
    top:95px;
}
xyz
{
    display:block;
    background-color:maroon;
    border-radius: 6px;
    width:150px;
    color:yellow;
    text-align: center;
    font-size: 40px;
    position: absolute;
    left:815px;
    top:95px;
}
mno
{
    display:block;
    background-color:maroon;
    border-radius: 6px;
    width:150px;
    color:yellow;
    text-align: center;
    font-size: 40px;
    position: absolute;
    left:1045px;
    top:95px;
}
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
        <mark>Marksheet</mark>
    </body>
</html>
