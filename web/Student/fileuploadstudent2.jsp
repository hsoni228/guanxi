<%-- 
    Document   : uploadFile
    Created on : 22 Mar, 2014, 12:05:11 AM
    Author     : Anirudh
--%>
<%@  page import="java.util.*,java.sql.*,javax.swing.*"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
    try{
    String user=(String)session.getAttribute("user");
    String sec=(String)session.getAttribute("sec");
    String utype=(String)session.getAttribute("type");
    
    if(user==null || utype.equals("student")==false)
          {
        String site ="http://localhost:8080/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
    String usern="";
    String sec1=""; 
    Connection c=null;
          Class.forName("com.mysql.jdbc.Driver");
          c=DriverManager.getConnection("jdbc:mysql://localhost:3306/guanxi","root", "root");
          String sql="select year,section,subject,user from mapping";
          Statement s=c.createStatement();
          ResultSet rs=s.executeQuery(sql);
          while(rs.next())
          {
              String tablename=rs.getString(1).charAt(0)+rs.getString(2)+rs.getString(3);
              //out.println(tablename);
              if(tablename.equals(sec))
              {
                  usern=rs.getString(4);
                  sec1=rs.getString(2);
                  break;
              }
          }
          File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String server_path ="c:\\Guanxi\\";
   out.println(server_path+"      ");

    String filePath = server_path+usern+"\\"+sec1+"\\";
//String filePath="/root/C/"+user+"/";
   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      
      factory.setRepository(new File("c:\\temp\\"));
      
  //    factory.setRepository(new File("/root/C/"+user));
      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
             //out.println("hello ");
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 )
            {
               // out.println("hello 2");
                file = new File( filePath + 
                fileName.substring( fileName.lastIndexOf("\\"))) ;
            }
            
            else
                {
                file = new File( filePath + 
                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                }
            out.println("hello "+ file);
            
            fi.write( file ) ;
            out.println("Uploaded Filename: " + filePath + fileName + "<br>");
          
          String rollno=(String)session.getAttribute("rollno");
          out.println("    ksldkasdlaskdl   "+rollno);
          String table=(String)session.getAttribute("sec");
          out.println("    ksldkasdlaskdl   "+table);
          String sql1="insert into file"+table+" values('"+rollno+"','"+filePath+fileName+"')";  
          out.println("    ksldkasdlaskdl   "+sql1);
          Statement s1=c.createStatement();
          s1.executeUpdate(sql1);
          String site ="http://localhost:8080/Guanxi/Teacher/fileuploadstudent1.jsp";
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site); 
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
    }
    catch(Exception e){
                    out.println(e);
                }
%>