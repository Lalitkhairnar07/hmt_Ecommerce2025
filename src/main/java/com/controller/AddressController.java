package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

@WebServlet("/AddressController")
public class AddressController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String address = request.getParameter("addressLine");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String label = request.getParameter("label");
		boolean isDefault = request.getParameter("isDefault") != null;
		
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("INSERT INTO address (addressLine, landmark, city, state, pincode, label, isDefault,userId)"
					+ " VALUES (?,?,?,?,?,?,?,?)");
			
			ps.setString(1, address);
			ps.setString(2, landmark);
			ps.setString(3, city);
			ps.setString(4, state);
			ps.setString(5, pincode);
			ps.setString(6, label);
			ps.setBoolean(7, isDefault);
			ps.setInt(8, userId);
			
			ps.executeUpdate();
			
			
			System.out.println("Address Added Successfully......");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
