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
        <script type="text/javascript" src="calendarDateInput.js">
            </script>
            <script type="text/javascript" src="DropCalendar.js"></script>
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
          session.setAttribute("subject", sub1);
          String sec1=request.getParameter("sec1");
          session.setAttribute("section", sec1);
          String sec="attend"+request.getParameter("sec");
          session.setAttribute("sec",sec);
          String sql3="SELECT fname,lname FROM loginteacher where user='"+user+"'";
           Statement s3 = c.createStatement();
             ResultSet rs3=s3.executeQuery(sql3);
             rs3.next();
             String name=rs3.getString(1)+" "+rs3.getString(2);
out.println("<bar><abc>"+name+"</abc><pqr>"+year1+" Year</pqr><xyz>"+sec1+"</xyz><mno>"+sub1+"</mno></bar>");          
//out.println(user+"<br>"+utype+"<br>"+year1+"<br>"+section+"<br>"+subject);
          if(user==null || utype.equals("teacher")==false || sec==null)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
           String sql="SELECT * FROM "+sec+"";
           Statement s = c.createStatement();
             ResultSet rs=s.executeQuery(sql);
   int count=1;
   out.println("<form action='attendenceadd3.jsp'><center><table><tr><th>S_No.</th><th>Year</th><th>Name</th></tr>");
   while(rs.next())
      {
      /*String sql4="SELECT fname,lname FROM loginstudent where user='"+rs.getString(2)+"'";
           Statement s4 = c.createStatement();
             ResultSet rs4=s4.executeQuery(sql4);
             rs4.next();
             String name5="";
             if(rs4.equals(name5)==false)
              name5=rs4.getString(1)+" "+rs4.getString(2);
             else name5=rs.getString(2);*/
       String name5=rs.getString(2);  
      out.println("<tr><td>"+count+"</td><td><input type='text' style='display:none;' name='roll"+count+"' value='"+rs.getString(1)+"'>"+rs.getString(1)+"</td>"+"<td>"+name5+"</td><td><input type='radio' name='radio"+count+"' value='P'><input type='radio' name='radio"+count+"' value='A'>"+"</tr>"); 
           //out.println("<BR>"); 
      count++;
       //rs.next();
      }
   out.println("<input type='text' placeholder='DDMMYYYY' name='date'>");
   out.println("<input type='submit' value='submit'>");
   String counter=count+"";
   session.setAttribute("count",counter);
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
        <mark>Attendence</mark>

    </body>
</html>
