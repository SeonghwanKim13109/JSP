package com.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloWorld
 */
//@WebServlet("/HWorld")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorld() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //doGet과 doPost모두 요청하기위한 method이다
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//HttpServletRequest request 요청 처리 객체
		//HttpServletResponse response 응답 처리 객체
		//tomcat에서 자동 생성된다
		//URL값으로 정보가 전송 보안 약함
		//https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=good
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<body>");
		writer.println("<h1>HelloWorld</h1>");
		writer.println("</body>");
		writer.println("</head>");
		writer.println("</html>");
		
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//header를 이용해 정보를 전송하여 보안 강함
		
	}

}
