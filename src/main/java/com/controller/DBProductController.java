package com.controller;

import java.io.IOException;
import java.security.cert.TrustAnchor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/DBProductController")
public class DBProductController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String productName = request.getParameter("productName");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		
		
//		System.out.println(productName + " "+ brand + ""+ category + "" + subcategory + " "+ quantity + "" +price+" ");
		
		boolean isError = false;
		
		if(productName == null || productName.isBlank()) {
			isError = true;
			request.setAttribute("productNameError", "Product name is require");
		}
		
		if(brand == null || brand.isBlank()) {
			isError = true;
			request.setAttribute("brandError","Brand is require");
		}else if (!brand.matches("[a-zA-Z ]+")) {
            
        	isError = true;
            request.setAttribute("brandError", "Enter a valid name (letters and spaces only)");
        }
		
		if(category == null || category.isBlank()) {
			isError = true;
			request.setAttribute("categoryError", "Category is require");
		}
		
		if(subcategory == null || subcategory.isBlank()) {
			isError = true;
			request.setAttribute("subcategoryError", "Subcategory is require");
		}
		
		
		if(quantity == null || quantity.isBlank()) {
			isError = true;
			request.setAttribute("quantityError", "Quantity is require");
		}
		
		if(price == null || price.isBlank()) {
			isError = true;
			request.setAttribute("priceError", "Price is require");
		}
		
		
		request.setAttribute("productName", productName);
		request.setAttribute("brand", brand);
		request.setAttribute("category", category);
		request.setAttribute("subcategory", subcategory);
		request.setAttribute("quantity", quantity);
		request.setAttribute("price", price);
		
		
		if(isError) {
			
			request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
	
		}else {
			
			try {
				
				Connection conn = DBConnection.getConnection();
				
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO products(productName, brand, category, subcategory, quantity, price)"
						+ " value(?,?,?,?,?,?)");
				
				pstmt.setString(1, productName);
				pstmt.setString(2, brand);
				pstmt.setString(3, category);
				pstmt.setString(4, subcategory);
				pstmt.setString(5, quantity);
				pstmt.setString(6, price);
				
				pstmt.executeUpdate();
				System.out.println("Product inserted...........");
	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//			request.getRequestDispatcher("DBProductList").forward(request, response);
		
			response.sendRedirect("DBProductList");
		}
		
	}
	
}
