<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .product-card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
        }

        .product-card:hover {
            transform: scale(1.02);
        }

        .product-title {
            font-weight: 600;
            font-size: 1.2rem;
        }

        .product-info {
            font-size: 0.9rem;
            color: #555;
        }

        .price {
            color: #28a745;
            font-weight: bold;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">All Products</h2>
        <a href="CustomerHome.jsp" class="btn btn-primary btn-sm mb-3 float-end">
   			← Back To Home
		</a>
    </div>
    
    
    <div class="row g-4 justify-content-center">
        <%
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        if (rs != null) {
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String brand = rs.getString("brand");
                String category = rs.getString("category");
                String subcategory = rs.getString("subcategory");
                Integer qty = rs.getInt("quantity");
                Integer price = rs.getInt("price");
        %>

        <div class="col-12 col-md-4 col-lg-4">
            <div class="card product-card h-100">
                <a href="ProductDetailController?productId=<%= productId %>" class="text-decoration-none text-dark">
                    <div class="card-body">  
                        <h5 class="product-title"><%= productName %></h5>
                        <p class="product-info mb-1">Brand: <strong><%= brand %></strong></p>
                        <p class="product-info mb-1">Category: <%= category %></p>
                        <p class="product-info mb-1">SubCategory: <%= subcategory %></p>
                        <p class="product-info mb-1">Stock: <%= qty %></p>
                        <p class="price">₹<%= price %></p>                	
                    </div>
                </a>
            </div>
        </div>

        <%
            }
        } else {
        %>
            <div class="col-12 text-center">
                <p class="text-muted">No products found.</p>
            </div>
        <%
        }
        %>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
