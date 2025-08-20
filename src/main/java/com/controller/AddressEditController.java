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

@WebServlet("/AddressEditController")
public class AddressEditController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Integer addressId = Integer.parseInt(request.getParameter("addressId"));
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select * from address where addressId = ?");
			pstmt.setInt(1, addressId);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			String addressLine = rs.getString("addressLine");
			String landmark = rs.getString("landmark");
			String city = rs.getString("city");
			String state = rs.getString("state");
			String pincode = rs.getString("pincode");
			String label = rs.getString("label");
			
			request.setAttribute("addressId", addressId);
			request.setAttribute("addressLine", addressLine);
			request.setAttribute("landmark", landmark);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("pincode", pincode);
			request.setAttribute("label", label);
			
			request.getRequestDispatcher("AddressUpdate.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
