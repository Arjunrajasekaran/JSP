<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*" %>
    <%
   // Get session creation time.
   Date createTime = new Date(session.getCreationTime());
   
   // Get last access time of this Webpage.
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Welcome Back to my website";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   String userIDKey = new String("userID");
   String userID = new String("ABCD");

   // Check if this is new comer on your Webpage.
   if (session.isNew() ){
      title = "Welcome to my website";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   } 
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
%>

<html>
<head>
<title>Session tracking</title>
</head>
  <%@page import="java.util.Date" %> 
  <body>     
    <%     
       long creationTime = session.getCreationTime();     
       String sessionId = session.getId();     
       long lastAccessedTime = session.getLastAccessedTime();     
       Date createDate= new Date(creationTime);     
       Date lastAccessedDate= new Date(lastAccessedTime);     
       StringBuffer buffer = new StringBuffer();     
       if(session.isNew())     
       {         
         buffer.append("<h3>Welcome </h3>");         
       }     
       else     
       {         
          buffer.append("<h3>Welcome Back!! </h3>");     
       }     
       buffer.append("<STRONG> Session ID : </STRONG>" + sessionId);     buffer.append(" <BR/> ");  
       buffer.append("<STRONG> Session Creation Time </STRONG>: " + createDate);     
       buffer.append(" <BR/> "); buffer.append("<STRONG> Last Accessed Time : </STRONG>" + lastAccessedDate);     
       buffer.append(" <BR/> ");        
    %>     
    <%=         buffer.toString()     %>  
</body>
</html>