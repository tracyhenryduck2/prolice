package com.server;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InitialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	public void init() throws ServletException {
		System.out.println("server start!...");
		String filePath=this.getServletConfig().getServletContext().getRealPath("/");
		System.out.println(filePath);
		if(filePath.contains("shake_bill")){
			initServer();
		}
	}
	
	private void initServer(){
		
	}
	
}