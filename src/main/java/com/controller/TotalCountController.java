package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/TotalCountController")
public class TotalCountController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int totalProducts = 0;
		int totalUser = 0;
		int totalCustomer = 0;
		int totalOrders = 0;
		
		
		try  {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select count(*) from products");
			
			ResultSet rs1 = pstmt.executeQuery();
			
			if(rs1.next()) {
				totalProducts = rs1.getInt(1);
			}
			
			
			PreparedStatement pstmt2 = conn.prepareStatement("select count(*) from users");
			
			ResultSet rs2 = pstmt2.executeQuery();
			
			if(rs2.next()) {
				totalUser = rs2.getInt(1);
			}
			
			
			PreparedStatement pstmt3 = conn.prepareStatement("select count(*) from users where role = 'customer'");
//			pstmt.setString(1, "customer");
			
			ResultSet rs3 = pstmt3.executeQuery();
			
			if(rs3.next()) {
				totalCustomer = rs3.getInt(1);
			}
			
			
			PreparedStatement pstmt4 = conn.prepareStatement("select count(*) from orders");
			
			ResultSet rs4 = pstmt4.executeQuery();
			
			if(rs4.next()) {
				totalOrders = rs4.getInt(1);
			}
			
			
//			PreparedStatement pstmt5 = conn.prepareStatement("");
//			
//			pstmt5.executeQuery();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("totalProducts", totalProducts);
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("totalCustomer", totalCustomer);
		request.setAttribute("totalOrders", totalOrders);

		request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
	
//		response.sendRedirect("AdminHome.jsp");
	}
	
}
