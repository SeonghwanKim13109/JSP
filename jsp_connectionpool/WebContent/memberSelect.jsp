<%@ page import="com.java.jsp.*" %>
<%@ page import ="java.util.ArrayList" %>
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
	 MemberDAO  memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
	
	for(int i = 0; i<dtos.size();i++){
		MemberDTO dto = dtos.get(i);
		String name = dto.getName();
		String id = dto.getId();
		String pw = dto.getPw();
		String phone = dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3();
		String brith = dto.getBirth();
		String sex = dto.getSex();
		
		out.println("name : "+ name +" id : " + id + " pw : " + pw+ " phone : "+phone+"<br/>");
	}
	%>
</body>
</html>