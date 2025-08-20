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

@WebServlet("/DBProductEditController")
public class DBProductEditController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer productId = Integer.parseInt(request.getParameter("productId"));
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select * from products where productId = ?");
			pstmt.setInt(1,productId);

			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			String productName = rs.getString("productName");
			String brand = rs.getString("brand");
			String category = rs.getString("category");
			String subcategory = rs.getString("subcategory");
			Integer quantity = rs.getInt("quantity");
			Integer price = rs.getInt("price");
			
			
			request.setAttribute("productId", productId);
			request.setAttribute("productName", productName);
			request.setAttribute("brand", brand);
			request.setAttribute("category", category);
			request.setAttribute("subcategory", subcategory);
			request.setAttribute("quantity", quantity);
			request.setAttribute("price", price);
			
			request.getRequestDispatcher("DbProductUpdate.jsp").forward(request, response);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
