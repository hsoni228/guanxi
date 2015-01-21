<%-- 
    Document   : attendadd
    Created on : Mar 23, 2014, 2:47:42 AM
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
        String date=request.getParameter("date");
        //out.println(date);
        String c1=(String)session.getAttribute("count");
        int count=Integer.parseInt(c1);
        int i;
        i=1;
        //out.println(date);
        String sec=(String)session.getAttribute("sec");
        String sub=(String)session.getAttribute("subject");
        //String att1=request.getParameter("radio1");
        String add="a"+date;
        //out.println("HeHEHEHE");
        //out.println(add);
        String tablename=sec;
        try
                {   
                    Connection c=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
                    //out.println("HeHEHEHE");
                    String sql="ALTER TABLE "+tablename+" ADD "+add+" varchar(30)";
                    String sql3="alter table "+tablename+" alter "+add+" set default 'P'";
                    //out.println(date+"");
                     Statement s = c.createStatement();
                     s.executeUpdate(sql);
                     s.executeUpdate(sql3); 
                     s.close();
                while(i<count)
                 {
                        String att=request.getParameter("radio"+i);  
                        String roll=request.getParameter("roll"+i);
                        String sql1="update "+tablename+" set "+add+"='"+att+"' where rno='"+roll+"'";
                        out.println(sql1);
                        Statement s2= c.createStatement();
                        int aff =s2.executeUpdate(sql1);
                        s2.close();
                        i++;
                    }
                
                }
        catch(Exception e)
                    {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
                   }
        
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
