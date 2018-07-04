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
	Cookie[] cookie = request.getCookies();
	
	for(int i = 0; i<cookie.length; i++){
		String str = cookie[i].getName();
		if(str.equals("cookieN")){
			out.println("cookie["+i+"] name : " +cookie[i].getName() + "<br/>");
			out.println("cookie["+i+"] value : " +cookie[i].getValue() + "<br/>");
			out.println("-------------------------------------");
		}
	}
	%>
	
	<a href = "cookiedle.jsp">cookie delete</a>
</body>
</html>