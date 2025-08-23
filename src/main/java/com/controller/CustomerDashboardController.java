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


@WebServlet("/CustomerDashboardController")
public class CustomerDashboardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		int totalOrders = 0;
		int totalCart = 0;
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
//			Total Order 
			PreparedStatement pstmt = conn.prepareStatement("select count(*) from orders where userId = ?");
			pstmt.setInt(1, userId);
			
			ResultSet rs1 = pstmt.executeQuery();
			
			if(rs1.next()) {
				totalOrders = rs1.getInt(1);
			}
			
//			Total Cart
			PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from cart where userId = ?");
			pstmt2.setInt(1, userId);
			
			ResultSet rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				totalCart = rs2.getInt(1);
			}
			
			
//			Added product to cart
			
			PreparedStatement pstmt3 = conn.prepareStatement(
					"SELECT 'Added product to cart' AS title, " +
						    "CONCAT(p.productName, ' was added to your shopping cart') AS message, " +
						    "c.cartId AS dateInfo " +
						    "FROM cart c " +
						    "JOIN products p ON c.productId = p.productId " +
						    "WHERE c.userId = ? " +
						    "ORDER BY c.cartId DESC LIMIT 1"
						    );
			
			pstmt3.setInt(1, userId);
			
			ResultSet rs3 = pstmt3.executeQuery();
			
			request.setAttribute("cartActivityRS", rs3);
			
			
//			Order
			
			PreparedStatement pstmt4 = conn.prepareStatement(
							"SELECT o.orderId, o.orderDate, o.price " +   // <- space at end
						    "FROM orders o " +                            // <- space at end
						    "WHERE o.userId = ? " +                       // <- space at end
						    "ORDER BY o.orderDate DESC"
						    );
			
			pstmt4.setInt(1, userId);
			
			ResultSet rs4 = pstmt4.executeQuery();
			
			request.setAttribute("orders", rs4);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("totalOrders", totalOrders);
		request.setAttribute("totalCart", totalCart);
		
		
		request.getRequestDispatcher("CustomerHome.jsp").forward(request, response);
	}
	
}
