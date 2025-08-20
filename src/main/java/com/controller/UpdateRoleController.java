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

@WebServlet("/UpdateRoleController")
public class UpdateRoleController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET role = ? where email = ?");
			pstmt.setString(1, role);
			pstmt.setString(2, email);
			
			int roleUpdate = pstmt.executeUpdate();
			
			if(roleUpdate > 0) {
				System.out.println("Role updated successfully for user: " + email);
			}else {
				System.out.println("No user found with email: " + email);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
