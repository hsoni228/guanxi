<%-- 
    Document   : loginPanel
    Created on : Jan 27, 2014, 12:05:11 AM
    Author     : KUNALK
--%>




<%@  page import="java.util.*,java.sql.*,javax.swing.*,java.awt.*"  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>
            <%
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            String flagCheck=request.getParameter("flag");
          //  out.println(user+" "+pass+" "+flagCheck);
            
            try
                {   Connection c=null;
                    Class.forName("com.mysql.jdbc.Driver");
                    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
                    int i,l1=user.length(),l2=pass.length(),flag=0;
                    char ch;
                    for(i=0;i<l1;i++)
                      { ch=user.charAt(i);
                          if(!(ch>='a' && ch<='z' || ch>='A' && ch<='Z' || ch>='0' && ch<='9' || ch=='_'))
                          {flag=1;
                          break;
                          }
                      }
                    for(i=0;i<l2;i++)
                      { ch=pass.charAt(i);
                          if(!(ch>='a' && ch<='z' || ch>='A' && ch<='Z' || ch>='0' && ch<='9' || ch=='_'))
                          {flag=1;
                          break;
                          }
                      }
                    if(flag==1 || l1<3 || l2<3 || l1>29 || l2>29 )
                      {   //out.println("Not found");
                        String site = "http://localhost:8080/Guanxi/Campcon/CampconError.htm";
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site); 
                          
                      }
                    else
                    {
                    // Connection c=ConnectionManager.getConnection();
                     String sql="SELECT pass FROM login"+flagCheck+" WHERE EXISTS(SELECT * FROM login"+flagCheck+" WHERE user='"+user+"')";
                     Statement s = c.createStatement();
                     ResultSet rsCheck=s.executeQuery(sql);
                     
                     boolean exists = rsCheck.next();
                     rsCheck.close();
                     s.close();
                     out.println();
                    // c.close();
                     
                    if(!exists)
                          { String site = "http://localhost:8080/Guanxi/Campcon/CampconError.htm";
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                          }
                            
                          
                     else
                    {   
                         String passQ="SELECT pass FROM login"+flagCheck+" WHERE user='"+user+"'";
                        // Connection c2 =ConnectionManager.getConnection();
                         Statement s2 = c.createStatement();
                         ResultSet rsCheck2 =s2.executeQuery(passQ);
                         rsCheck2.next();
                         String pow=rsCheck2.getString(1);
                         rsCheck2.close();
                         s.close();
                      // c.close();
                       if(pow.equals(pass)==true)
                           {//out.println("Yes, you are registered");
                               session.setAttribute("user",user);
                               session.setAttribute("type",flagCheck);
                               String site="";
                               if(flagCheck.equals("admin"))
                                     site ="http://localhost:8080/Guanxi/admin.htm";
                               else if(flagCheck.equals("teacher"))
                                  site ="http://localhost:8080/Guanxi/Teacher/teacher.htm";
                               else
                                    site ="http://localhost:8080/Guanxi/Student/student.htm";
                             //ConnectionManager.getQues(score) ;
                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site); 
                            
                           }
                       
                       else
                            {// out.println("Wrong Password"+pow);
                              String site = "http://localhost:8080/Guanxi/Campcon/CampconError.htm";
                      response.setStatus(response.SC_MOVED_TEMPORARILY);
                              response.setHeader("Location", site); 
                          }
                            
                    }
                    
                 
                    
                     
                      
                      System.out.println( "Thanks");
                    }
                    c.close();
                  }
              catch(Exception e)
                    {/*String site = "http://localhost:8080/Guanxi/Campcon/CampconError.htm";
                     response.setStatus(response.SC_MOVED_TEMPORARILY);
                     response.setHeader("Location", site);*/  
                    System.out.println(e);
                      out.println(e);
                   }



            %>
        </h1>
    </body>
</html>


