<%@page import="java.util.Enumeration"%>
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
	Enumeration enumeration = session.getAttributeNames();
	
	int i = 0;
	while(enumeration.hasMoreElements()){
		i++;
		
		String sName = enumeration.nextElement().toString();
		String sValue = session.getAttribute(sName).toString();
		out.println("sName : "+ sName +"<br/>");
		out.println("sValue : "+ sValue +"<br/>");
	}
	
	if(i == 0)
		out.println("세션 만료" +"<br/>");
	%>
</body>
</html>