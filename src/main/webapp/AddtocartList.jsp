<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart List</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .cart-header {
            background: #0d6efd;
            color: #fff;
            padding: 15px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .product-card {
            border-radius: 15px;
            overflow: hidden;
            border: none;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease-in-out;
            background: #fff;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .product-title {
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .price {
            color: #198754;
            font-weight: 700;
            font-size: 1.1rem;
        }

        .btn-danger {
            border-radius: 25px;
            padding: 6px 15px;
            font-size: 0.9rem;
        }

        .btn-success {
            border-radius: 30px;
            padding: 12px 25px;
            font-size: 1.1rem;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(25,135,84,0.3);
            transition: all 0.3s;
        }

        .btn-success:hover {
            background-color: #157347;
            transform: scale(1.03);
        }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4 cart-header">
        <h2 class="mb-0">🛒 Your Cart</h2>
    </div>
    <div class="row g-4 justify-content-center">
        <%
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        if (rs != null) {
            while (rs.next()) {
              	Integer productId = rs.getInt("productId"); 
              	Integer cartId = rs.getInt("cartId");
                String productName = rs.getString("productName");
                Integer price = rs.getInt("price");
        %>

        <div class="col-12 col-md-6 col-lg-4">
            <div class="card product-card h-100">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="product-title"><%= productName %></h5>
                        <p class="price">₹<%= price %></p>
                    </div>
                    <div class="mt-3">
                        <!-- Remove button  -->
			            <a href="RemoveFromCartController?cartId=<%=cartId%>" 
                           class="btn btn-danger btn-sm"> Remove </a> 
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        } else {
        %>
            <div class="col-12 text-center">
                <p class="text-muted fs-5">Your cart is empty 🛍️</p>
            </div>
        <%
        }
        %>
    </div>
    
    <!-- Checkout Button -->
    <div class="mt-5 text-end">
        <a href="OrderController" class="btn btn-success btn-lg">
            ✅ Proceed to Checkout
        </a>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
