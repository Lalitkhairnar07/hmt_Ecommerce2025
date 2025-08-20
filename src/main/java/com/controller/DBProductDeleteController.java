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

@WebServlet("/DBProductDeleteController")
public class DBProductDeleteController extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("DELETE from products where productId = ?");
			pstmt.setInt(1, productId);
			
			int record = pstmt.executeUpdate();
			
			if(record == 0) {
				System.out.println("Somthing Went Wrong.");
			}else {
				System.out.println(record + "Record deleted successfully.");
			}
			
			response.sendRedirect("DBProductList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("DELETE from products where productId = ?");
			pstmt.setInt(1, productId);
			
			int record = pstmt.executeUpdate();
			
			if(record == 0) {
				System.out.println("Somthing Went Wrong.");
			}else {
				System.out.println(record + " Record deleted successfully.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("DBProductList");
		
	}
	
}
