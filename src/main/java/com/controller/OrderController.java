package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		Integer productId = Integer.parseInt(request.getParameter("productId"));
//		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
			
			LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String orderDate = now.format(formatter);
            
            
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("SELECT c.cartId, p.productName, p.price , p.productId " + 
			"FROM cart c " + 
					"JOIN products p ON c.productId = p.productId " + 
			"WHERE c.userId = ?");
			
			pstmt.setInt(1, userId);
		
			ResultSet rs = pstmt.executeQuery();
			
//			double price = 0;
//            if (rs.next()) {
//                price = rs.getDouble("price");
//            } else {
//                response.getWriter().println("Product not found!");
//                return;
//            }
			
			while(rs.next()) {
				
				int productId = rs.getInt("productId");
				int price = rs.getInt("price");
				
				PreparedStatement ps = conn.prepareStatement("INSERT INTO orders(productId, userId, price, orderDate) "
						+ "VALUES(?, ?, ?, ?)");
				ps.setInt(1, productId);
				ps.setInt(2, userId);
				ps.setInt(3, price);
				ps.setString(4, orderDate);

				ps.executeUpdate();
			
				System.out.println("Ordered Successfully");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
