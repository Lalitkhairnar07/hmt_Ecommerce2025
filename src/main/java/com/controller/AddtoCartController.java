package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

@WebServlet("/AddtoCartController")
public class AddtoCartController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("INSERT INTO cart (userId, productId) VALUES(?, ?)");
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			
			ps.executeUpdate();
			
			System.out.println("Added to cart.....");
			response.sendRedirect("ProductListController");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
