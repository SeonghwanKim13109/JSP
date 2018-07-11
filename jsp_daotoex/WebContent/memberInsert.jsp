<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!Connection con;
	PreparedStatement pStmt;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";%>

	<%
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, upw);
			int n;
			String query = "insert into memberforpre(id,pw,name,phone) values (?,?,?,?)";
			pStmt = con.prepareStatement(query);

			pStmt.setString(1, "abc");
			pStmt.setString(2, "123");
			pStmt.setString(3, "Hong");
			pStmt.setString(4, "9938");
			n = pStmt.executeUpdate();

			pStmt.setString(1, "def");
			pStmt.setString(2, "456");
			pStmt.setString(3, "Kim");
			pStmt.setString(4, "9998");
			n = pStmt.executeUpdate();

			pStmt.setString(1, "ghi");
			pStmt.setString(2, "789");
			pStmt.setString(3, "Lee");
			pStmt.setString(4, "4174");
			n = pStmt.executeUpdate();

			if (n == 1)
				out.println("success");
			else
				out.println("failed");
		} catch (Exception e) {

		} finally {
			try {
				if (pStmt != null)
					pStmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

	<br />
	<a href="memberView.jsp">회원 정보 보기</a>

</body>
</html>