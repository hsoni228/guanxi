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
          String year1=request.getParameter("year");
          String sub1=request.getParameter("sub");
          String sec1=request.getParameter("sec1");
          String sec=request.getParameter("sec");
         // String sql3="SELECT fname,lname FROM loginteacher where user='"+user+"'";
           //Statement s3 = c.createStatement();
             //ResultSet rs3=s3.executeQuery(sql3);
             //rs3.next();
             //String name=rs3.getString(1)+" "+rs3.getString(2);
        //  String year=sec.charAt(0)+"";
         // String section=sec.substring(1,4);
          //String subject=sec.substring(4);
//out.println("<bar><abc>"+name+"</abc><pqr>"+year1+" Year</pqr><xyz>"+sec1+"</xyz><mno>"+sub1+"</mno></bar>");          
//out.println(user+"<br>"+utype+"<br>"+year1+"<br>"+section+"<br>"+subject);
          if(user==null || utype.equals("student")==false || sec==null)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
          out.println(sec);
          String rollno=(String)session.getAttribute("rollno");
           String sql="SELECT * FROM "+sec+" where roll='"+rollno+"'";
           Statement s = c.createStatement();
           out.println(sec+" "+sql);
             ResultSet rs=s.executeQuery(sql);
             out.println(sql);
   int count=1;
   out.println(sql);
   out.println("<center><table><tr><th>S_No.</th><th>Roll_No.</th><th>Name</th><th>Sessional1</th><th>Sessional2</th><th>Attendence</th><th>Internal</th><th>Final</th></tr>");
  out.println(sql);
   while(rs.next())
      {String tablename=rs.getString(1).charAt(0)+rs.getString(3)+rs.getString(2);
      /*String sql4="SELECT fname,lname FROM loginstudent where user='"+rs.getString(2)+"'";
           Statement s4 = c.createStatement();
             ResultSet rs4=s4.executeQuery(sql4);
             rs4.next();
             String name5="";
             if(rs4.equals(name5)==false)
              name5=rs4.getString(1)+" "+rs4.getString(2);
              else name5=rs.getString(2);*/
               String name5=rs.getString(2);
           out.println("<tr><td>"+count+"</td><td>"+rs.getString(1)+"</td>"+"<td>"+name5+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td>"+"</tr>"); 
      count++;
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
    <body bgcolor="yellow">
        <mark>Marksheet</mark>
    </body>
</html>
