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

@WebServlet("/AddressUpdateController")
public class AddressUpdateController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			Integer addressId = Integer.parseInt(request.getParameter("addressId"));
			String addressLine = request.getParameter("addressLine");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String label = request.getParameter("label");
			
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("UPDATE address SET addressLine = ?, landmark = ?, city = ?, state = ?, pincode = ?, label = ? where addressId = ?");
			ps.setString(1, addressLine);
			ps.setString(2, landmark);
			ps.setString(3, city);
			ps.setString(4, state);
			ps.setString(5, pincode);
			ps.setString(6, label);
			ps.setInt(7, addressId);
			
			int record = ps.executeUpdate();
			
			if(record > 0) {
				System.out.println("Update Successfully.......");
				response.sendRedirect("AddressDataController");
			}else {
				response.getWriter().println();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
