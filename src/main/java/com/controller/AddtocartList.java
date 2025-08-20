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

@WebServlet("/AddtocartList")
public class AddtocartList extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//Integer productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("SELECT c.cartId, p.productName, p.price , p.productId " +
				    "FROM cart c " +
				    "JOIN products p ON c.productId = p.productId " +
				    "WHERE c.userId = ?");
			ps.setInt(1, userId);
			//ps.setInt(2, productId);
			
			ResultSet rs = ps.executeQuery();
			
			request.setAttribute("rs", rs);
			
			request.getRequestDispatcher("AddtocartList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
