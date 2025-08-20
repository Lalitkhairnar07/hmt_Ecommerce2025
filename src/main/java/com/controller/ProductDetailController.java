package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/ProductDetailController")
public class ProductDetailController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select * from products where productId = ?");
			pstmt.setInt(1, productId);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			request.setAttribute("rs", rs);
			
			request.getRequestDispatcher("ProductDetail.jsp").forward(request, response);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
