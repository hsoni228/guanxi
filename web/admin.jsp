<%-- 
    Document   : admin
    Created on : Mar 19, 2014, 11:21:17 PM
    Author     : ANIRUDH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>
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
    String admin=(String)session.getAttribute("user");
    String utype=(String)session.getAttribute("type");
//out.println("user is"+user);
    if(admin==null || utype.equals("admin")==false)
    {
        String site ="http://107.170.120.25:8080/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
    }
            String fname=request.getParameter("f_name");
            String lname=request.getParameter("l_name");
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            String type=request.getParameter("type");
            String sex=request.getParameter("gender");
            String email=request.getParameter("email_id");
            String post=request.getParameter("post");
            String age=request.getParameter("age");
            String dept=request.getParameter("depart");
            String section=request.getParameter("section");
            String rollno=request.getParameter("rollno");
            String year=request.getParameter("year");
            String contactno=request.getParameter("contactno");
            out.println(user+" "+pass+" "+type+" "+sex+" "+fname+" " +lname);
            Connection c=null;
            Class.forName("com.mysql.jdbc.Driver");
            c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
            if(type.equals("student"))  
               {
                   
                   String sql="SELECT pass FROM login"+type+" WHERE EXISTS(SELECT * FROM login"+type+" WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                     
                     
                    if(!exists)
                          { String sql2="insert into login"+type+" values('"+user+"','"+pass+"','"+fname+"','"+lname+"','"+email+"','"+sex+"','"+rollno+"','"+dept+"','"+section+"','"+year+"','"+contactno+"');";
                          
                           
                            Statement s2=c.createStatement();
                            s2.executeUpdate(sql2);
                            s2.close();
                            //c.close();
                        //out.println("data "+user+" "+pass);   
                         String site = "http://107.170.120.25:8080/Guanxi/admin.htm";
                         response.setStatus(response.SC_MOVED_TEMPORARILY);
                         response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {     
                          String site = "http://107.170.120.25:8080/Guanxi/adminerror.html";
                          response.setStatus(response.SC_MOVED_TEMPORARILY);
                          response.setHeader("Location", site); 
                          
                            
                    }
                    
                 
                   
               }
            else if(type.equals("teacher")==true)
            {//teacher
                String sql="SELECT pass FROM login"+type+" WHERE EXISTS(SELECT * FROM login"+type+" WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                     
                     
                    if(!exists)
                          { String sql2="insert into login"+type+" values('"+user+"','"+pass+"','"+fname+"','"+lname+"','"+email+"','"+sex+"','"+dept+"','"+post+"','"+"','');";
                                                 
                            Statement s2=c.createStatement();
                            s2.executeUpdate(sql2);
                            s2.close();
                            //c.close();
                            String site = "http://107.170.120.25:8080/Guanxi/admin.htm";
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {     
                          String site = "http://107.170.120.25:8080/Guanxi/adminerror.html";
                          response.setStatus(response.SC_MOVED_TEMPORARILY);
                          response.setHeader("Location", site); 
                          
                            
                    }
                    

            }
            else
            {
               //admin
                String sql="SELECT pass FROM login"+type+" WHERE EXISTS(SELECT * FROM login"+type+" WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                     
                     
                    if(!exists)
                          { String sql2="insert into login"+type+" values('"+user+"','"+pass+"','"+fname+"','"+lname+"');";
                          
                           
                            Statement s2=c.createStatement();
                            s2.executeUpdate(sql2);
                            s2.close();
                            //c.close();
                            String site = "http://107.170.120.25:8080/Guanxi/admin.htm";
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {     
                          String site = "http://107.170.120.25:8080/Guanxi/adminerror.html";
                          response.setStatus(response.SC_MOVED_TEMPORARILY);
                          response.setHeader("Location", site); 
                          
                            
                    }
            }
                
   
}
    catch(Exception e)
     {out.println("There has been an exception. Call/mail me asap!");
                     System.out.println(e);
                      out.println(e);
      }
%>

        </h1>
    </body>
</html>
