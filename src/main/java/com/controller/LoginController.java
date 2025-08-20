package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isError = false;

        
        if (email == null || email.isBlank()) {
            isError = true;
            request.setAttribute("EmailError", "Email is required");
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,6}$")) {
            isError = true;
            request.setAttribute("EmailError", "Invalid email format");
        }

        
        if (password == null || password.isBlank()) {
            isError = true;
            request.setAttribute("PasswordError", "Password is required");
        } else if (password.length() < 6) {
            isError = true;
            request.setAttribute("PasswordError", "Password must be at least 6 characters");
        }

        
        request.setAttribute("email", email);
        
        

        if (isError) {
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        } else {
        	
        	try {
        		
        		
        		Connection conn = DBConnection.getConnection();
        		PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?;");
        		pstmt.setString(1, email);
        		pstmt.setString(2, password);
        		
        		ResultSet rs = pstmt.executeQuery();
        		HttpSession session = request.getSession();
        		
        		if(rs.next()) {
        			
        			String role = rs.getString("role");
        		
        			int userId = rs.getInt("userId");
        			
                    session.setAttribute("userId", userId);

                    if ("admin".equalsIgnoreCase(role)) {
                    	
                        response.sendRedirect("TotalCountController");
                        
                    } else if ("customer".equalsIgnoreCase(role)) {
                    	
                        response.sendRedirect("CustomerHome.jsp");
                        
                    }
                    
        			} else {
        				// Invalid credentials
        				response.sendRedirect("Login.jsp");
        			}
        		
        	}catch(Exception e) {
        		
        		e.printStackTrace();
        	}
            
//                request.setAttribute("message", "Login Successful. Welcome!");
//                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//                rd.forward(request, response);
//               
        }
	}
	
}
