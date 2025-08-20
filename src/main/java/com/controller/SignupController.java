package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/SignupController")
public class SignupController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean isError = false;

        if (username == null || username.isBlank()) {
        	
            isError = true;
            request.setAttribute("FirstNameError", "Enter your User name");
        } else if (!username.matches("[a-zA-Z ]+")) {
            
        	isError = true;
            request.setAttribute("FirstNameError", "Enter a valid name (letters and spaces only)");
        }

        if (email == null || email.isBlank()) {
            
        	isError = true;
            request.setAttribute("EmailError", "Enter your email");
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[A-Za-z]{2,6}$")) {
            
        	isError = true;
            request.setAttribute("EmailError", "Enter a valid email address");
        }

        if (password == null || password.isBlank()) {
            
        	isError = true;
            request.setAttribute("PasswordError", "Enter a password");
        } else if (password.length() < 6) {
            
        	isError = true;
            request.setAttribute("PasswordError", "Password must be at least 6 characters");
        
        }

        if (confirmPassword == null || confirmPassword.isBlank()) {
        
        	isError = true;
            request.setAttribute("ConfirmPasswordError", "Please confirm your password");
        } else if (!password.equals(confirmPassword)) {
           
        	isError = true;
            request.setAttribute("ConfirmPasswordError", "Passwords do not match");
        }

        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("contactNumber", contactNumber);
        request.setAttribute("gender", gender);
        request.setAttribute("password", password); 
        request.setAttribute("confirmPassword", confirmPassword);
        
        
        

        if (isError) {
        	
            RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
            rd.forward(request, response);
        
        } else {
        	
        	try {
            	
            	Connection conn = DBConnection.getConnection();
            	
            	LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String createdAt = now.format(formatter);

            	
            	PreparedStatement pstmt = conn.prepareStatement("insert into users (username,email,contactNumber,gender,password, role, active, createdAt) "
            			+ "values(?,?,?,?,?,?,?,?)");
            	pstmt.setString(1, username);
            	pstmt.setString(2, email);
            	pstmt.setString(3, contactNumber);
            	pstmt.setString(4, gender);
            	pstmt.setString(5, password);
            	pstmt.setString(6, "customer");              // default role
                pstmt.setBoolean(7, true);               // active = true
                pstmt.setString(8, createdAt);
            	
            	
            	pstmt.executeUpdate();
    			System.out.println("Record inserted...........");
    			
            }catch(Exception e) {
            	
            	e.printStackTrace();
            }
        	
            request.setAttribute("message", "Welcome " + username + "! Please log in.");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        
        }
    
    }

}
