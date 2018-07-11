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
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String uid ="scott";
	String upw ="tiger";
	String query = "select * from memberforpre";
	%>
	
	<%
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url,uid,upw);
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			
			out.println("id : "+id +" pw : "+pw +" name : "+name +" phone : "+phone+"<br/>");
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(con!=null)con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	%>
</body>
</html>