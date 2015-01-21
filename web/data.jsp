<%-- 
    Document   : data
    Created on : 22 Mar, 2014, 4:45:52 PM
    Author     : Himanshu Soni
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
        
        <h1>
            
            <%
            try
            {
               String dbname=request.getParameter("dbname");
            String tbname=request.getParameter("tbname");
            int count=(Integer.parseInt((request.getParameter("count"))));
            String s[]=new String[12];
            Connection c=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
                    
            int i;
            for(i=0;i<count;i++)
                  s[i]=request.getParameter("col"+(i+1));
            String sql="create table "+tbname+"(";
            for(i=0;i<count-1;i++)
            {
                sql+=s[i]+",";
            }
            sql+=s[i]+")";
            Statement s2 = c.createStatement();
                     //ResultSet rsCheck=
                             s2.executeUpdate(sql);
                     String site = "www.yahoo.com";
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site); 
                     
            }
            catch(Exception e){
//            String site = "www.google.com";
//                        response.setStatus(response.SC_MOVED_TEMPORARILY);
//                        response.setHeader("Location", site); 
                out.println(e);
            }
              %>
            
        </h1>
    </body>
</html>
