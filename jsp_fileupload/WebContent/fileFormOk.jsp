<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String path = request.getRealPath("fileFolder");
	
	int size = 1024*1024*10;
	String file ="";
	String oriFile="";
	
	MultipartRequest  multi = new MultipartRequest(request,path,size,"EUC-KR",new DefaultFileRenamePolicy());
	
	Enumeration files = multi.getFileNames();
	String str =(String)files.nextElement();
	
	file=multi.getFilesystemName(str);
	oriFile = multi.getOriginalFileName(str);
	%>

</body>
	file upload success!
</html>