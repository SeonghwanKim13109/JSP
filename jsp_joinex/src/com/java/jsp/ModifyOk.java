package com.java.jsp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private Statement statement;
	HttpSession httpSession;

	private String id, pw, name, birth, phone1, phone2, phone3, sex;
	private String pw_confirm;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyOk() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		httpSession = request.getSession();
		id = (String) httpSession.getAttribute("id");
		name = request.getParameter("name");
		birth = request.getParameter("birth");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		sex = request.getParameter("sex");
		
		if (pwConfirm()) {
			System.out.println("2");
			try {
				String query = "update member set name ='" + name + "',"
						+ "birth='"+birth+"',"
								+ "phone1 = '" + phone1 + "' ,"
										+ "phone2 = '" + phone2+ "' ,"
												+ "phone3 = '" + phone3 + "', "
														+ "sex = '" + sex + "' "
																+ "where id ='"+id+"'";
				System.out.println(query);
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
				statement = connection.createStatement();
				int i = statement.executeUpdate(query);
				System.out.println(i);
				if (i == 1) {
					System.out.println("update success");
					httpSession.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				} else {
					System.out.println("update fail");
					response.sendRedirect("modify.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (statement != null)
						statement.close();
					if (connection != null)
						connection.close();
				} catch (Exception e) {

				}
			}
		}else {
			System.out.println("password incorrect");
		}
	}

	private boolean pwConfirm() {
		String sessionPw = (String) httpSession.getAttribute("pw");

		if (sessionPw.equals(pw))
			return true;
		else
			return false;
	}
}
