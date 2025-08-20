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

@WebServlet("/AddressDeleteController")
public class AddressDeleteController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer addressId = Integer.parseInt(request.getParameter("addressId"));
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("DELETE from address where addressId = ?");
			pstmt.setInt(1, addressId);
			
			
			int recorde = pstmt.executeUpdate();
			
			if (recorde == 0) {
				System.out.println("Somthing went wrong");
			}else {
				System.out.println(recorde + " Address deleted Successfully....");
			}
			
			response.sendRedirect("AddressDataController");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}