package com.java.jsp;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;

import javax.sql.DataSource;

public class MemberDAO {
/*	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";
*/	
	private DataSource dataSource;
	public MemberDAO() {
		// TODO Auto-generated constructor stub
	/*	try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> memberSelect() {
		ArrayList<MemberDTO> dtos = new ArrayList();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from member");

			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String birth = rs.getString("birth");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String sex = rs.getString("sex");

				MemberDTO dto = new MemberDTO(name, birth, id, pw, phone1, phone2, phone3, sex);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

}
