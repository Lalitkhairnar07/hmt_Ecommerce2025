package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/DBProductList")
public class DBProductList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select * from products");
			ResultSet rs = pstmt.executeQuery();
			
			request.setAttribute("rs", rs);
			
		    RequestDispatcher rd = request.getRequestDispatcher("DBProductsList.jsp");
		    rd.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
