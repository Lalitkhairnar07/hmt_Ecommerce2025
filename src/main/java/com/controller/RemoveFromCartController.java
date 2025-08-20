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
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

@WebServlet("/RemoveFromCartController")
public class RemoveFromCartController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		Integer productId = Integer.parseInt(request.getParameter("productId"));
		
		Integer cartId = Integer.parseInt(request.getParameter("cartId"));
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("DELETE FROM cart WHERE cartId = ? AND userId = ?");
			ps.setInt(1, cartId);
			ps.setInt(2, userId);
			
			int rows = ps.executeUpdate();
			
			if (rows > 0) {
                System.out.println("Product removed from cart: " + cartId);
            }
			
			response.sendRedirect("AddtocartList");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
