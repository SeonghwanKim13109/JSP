package com.java.jsp;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection connection;
	private Statement statement;

	private String name, birth, id, pw, phone1, phone2, phone3, sex;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinOk() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		name = request.getParameter("name");
		birth = request.getParameter("birth");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		sex = request.getParameter("sex");
		System.out.println(name);
		if(name.equals("") || birth.equals("")||id.equals("")||pw.equals("")||phone2.equals("")||phone3.equals("")||sex.equals(""))
			response.sendRedirect("join.html");
		else {
			String query = "insert into member values('" + name + "','" + birth + "','" + id + "','" + pw + "','"
					+ phone1 + "','" + phone2 + "','" + phone3 + "','" + sex + "')";

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
				statement = connection.createStatement();
				int i = statement.executeUpdate(query);
				if (i == 1) {
					System.out.println("insert success");
					response.sendRedirect("joinResult.jsp");
				} else {
					System.out.println("insert fail");
					response.sendRedirect("join.html");
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
		}
	}
}
