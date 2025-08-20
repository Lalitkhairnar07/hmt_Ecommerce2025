package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/DBProductUpdateController")
public class DBProductUpdateController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			Integer productId = Integer.parseInt(request.getParameter("productId"));
			String productName = request.getParameter("productName");
			String brand = request.getParameter("brand");
			String category = request.getParameter("category");
			String subcategory = request.getParameter("subcategory");
			Integer quantity = Integer.parseInt(request.getParameter("quantity"));
			Integer price = Integer.parseInt(request.getParameter("price"));
			
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE products SET productName = ?, brand = ?, category = ?, subcategory = ?, quantity = ?, price = ? WHERE productId = ?");
			
			pstmt.setString(1, productName);
			pstmt.setString(2, brand);
			pstmt.setString(3, category);
			pstmt.setString(4, subcategory);
			pstmt.setInt(5, quantity);
			pstmt.setInt(6, price);
			pstmt.setInt(7, productId);
			
			int rows = pstmt.executeUpdate();
			
			if(rows > 0) {
				response.sendRedirect("DBProductList");
			}else {
				response.getWriter().println();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
