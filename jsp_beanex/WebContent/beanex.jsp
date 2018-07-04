<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="student" class="com.java.jsp.Student" scope="page"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<jsp:setProperty property="name" name="student" value="John"/>
	<jsp:setProperty property="age" name="student" value="19"/>
	<jsp:setProperty property="grade" name="student" value="6"/>
	<jsp:setProperty property="studentId" name="student" value="2011104060"/>
	
	이름 : <jsp:getProperty name = "student" property="name"/><br/>
	나이 : <jsp:getProperty name = "student" property="age"/><br/>
	학년 : <jsp:getProperty name = "student" property="grade"/><br/>
	학번 : <jsp:getProperty name = "student" property="studentId"/><br/>
</body>
</html>