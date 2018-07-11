<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%! 
	Connection connection;
	Statement statement;
	ResultSet resultSet;
	
	String name,birth,id,pw,phone1,phone2,phone3,sex;
	String pw_confirm;
	%>
	
	<%
	id = (String)session.getAttribute("id");
	session.setAttribute("id", id);
	String query = "select * from member where id = '"+id+"'";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
	statement = connection.createStatement();
	resultSet = statement.executeQuery(query);
	
	while(resultSet.next()){
		birth = resultSet.getString("birth");
		name = resultSet.getString("name");
		pw = resultSet.getString("pw");
		phone1 = resultSet.getString("phone1");
		phone2 = resultSet.getString("phone2");
		phone3 = resultSet.getString("phone3");
		sex = resultSet.getString("sex");
	}
	%>
	<form action="ModifyOk" method="post">
	이름       : <input type="text" name ="name" size="10" value =<%= name %>><br/>
	생년월일 : <input type="text" name="birth" size="10" value =<%= birth %>><br/>
	id    : <%= id %><br/>
	pw    : <input type="password" name="pw" size="10"><br/>
	phone : <select name="phone1">
	<option value ="010">010</option>
	<option value ="011">011</option>
	<option value ="016">016</option>
	<option value ="017">017</option>
	<option value ="018">018</option>
	<option value ="019">019</option>
	</select>-
	<input type="text" name ="phone2"size="5" value = <%= phone2 %>>-<input type="text" name ="phone3"size="5" value =<%= phone3 %>><br/>
	<% 
		if(sex.equals("man")){
			
	%>
	sex : <input type="radio" name ="sex" value="man" checked="checked">남 &nbsp;<input type="radio" name ="sex" value="woman">여<br/>
	<%
		}else{
	%>
	sex : <input type="radio" name ="sex" value="man" checked="checked">남 &nbsp;<input type="radio" name ="sex" value="woman" checked ="checked">여<br/>
	<%
	} 
	%>
	<input type="submit" value ="정보수정"><input type="reset" value="취소">
	</form>

</body>
</html>