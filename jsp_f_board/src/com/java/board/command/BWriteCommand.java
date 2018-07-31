package com.java.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.board.dao.BDao;

public class BWriteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bTitle = request.getParameter("bTitle");
		String bName = request.getParameter("bName");
		String bContent = request.getParameter("bContent");
		
		BDao dao = new BDao();
		dao.write(bTitle,bName,bContent);
	}

}
