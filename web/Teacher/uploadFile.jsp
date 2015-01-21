<%-- 
    Document   : uploadFile
    Created on : 22 Mar, 2014, 12:05:11 AM
    Author     : Anirudh
--%>

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
    if(user==null || utype.equals("teacher")==false)
          {
        String site ="http://localhost:8084/Guanxi/Campcon/Campcon.htm";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site); 
          }
    File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String server_path = getServletContext().getRealPath("/");
   out.println(server_path+"      ");
   File f=null;
                boolean b=false;
                try{
                    f=new File(server_path+user);
                    b=f.mkdir();
                    out.println("Directory Created "+b);
                }
                catch(Exception e){
                    out.println(e);
                    e.printStackTrace();
                }
    File f1=null;
                boolean b1=false;
                try{
                    f1=new File(server_path+user+"/"+sec);
                    b1=f1.mkdir();
                    out.println("Directory Created "+b1);
                }
                catch(Exception e){
                    out.println(e);
                    e.printStackTrace();
                }
    String filePath = server_path+user+"/"+sec+"/";
//String filePath="/root/C/"+user+"/";
   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      
      factory.setRepository(new File("/var/lib/tomcat7/webapps/"));
      
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
            if( fileName.lastIndexOf("/") >= 0 )
            {
               // out.println("hello 2");
                file = new File( filePath + 
                fileName.substring( fileName.lastIndexOf("/"))) ;
            }
            
            else
                {
                file = new File( filePath + 
                fileName.substring(fileName.lastIndexOf("/")+1)) ;
                }
            out.println("hello "+ file);
            
            fi.write( file ) ;
            out.println("Uploaded Filename: " + filePath + 
            fileName + "<br>");
            String site ="http://http://localhost:8084/Guanxi/Teacher/fileupload.jsp";
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