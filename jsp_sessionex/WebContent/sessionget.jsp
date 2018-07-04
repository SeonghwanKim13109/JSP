<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/hml; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
	String mySessionName= (String)session.getAttribute("mySessionName");
	out.println(mySessionName+"<br/>");
	
	Integer myNum =(Integer)session.getAttribute("myNum");
	out.println(myNum+"<br/>");
	out.println("=================================<br/>");
	
	String sName,sValue;
	Enumeration enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()){
		sName = enumeration.nextElement().toString();
		sValue = session.getAttribute(sName).toString();
		out.println("sName : "+ sName +"<br/>");
		out.println("sValue : "+ sValue +"<br/>");
	}
	
	out.println("=================================<br/>");
	
	String sessionId = session.getId();
	out.println("sessionId :  "+sessionId+"<br/>");
	int sessionInter = session.getMaxInactiveInterval();
	out.println("sessionInterval :  "+sessionInter+"<br/>");
	
	out.println("=================================<br/>");
	
	session.removeAttribute("mySessionName");
	enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()){
		sName = enumeration.nextElement().toString();
		sValue = session.getAttribute(sName).toString();
		out.println("sName : "+ sName +"<br/>");
		out.println("sValue : "+ sValue +"<br/>");
	}
	out.println("=================================<br/>");
	session.invalidate();
	if(request.isRequestedSessionIdValid()){
		out.println("session valid");
	}else
		out.println("session invalid");
	%>
</body>
</html>