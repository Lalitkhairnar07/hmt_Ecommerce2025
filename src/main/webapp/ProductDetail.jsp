<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .product-card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .price {
            color: #28a745;
            font-weight: bold;
            font-size: 1.4rem;
        }
    </style>
</head>
<body>

<div class="container py-5">
    <a href="ProductListController" class="btn btn-outline-secondary mb-4">← Back to Products</a>

    <%
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        if (rs != null && rs.next()) {
            Integer productId = rs.getInt("productId");
            String productName = rs.getString("productName");
            String brand = rs.getString("brand");
            String category = rs.getString("category");
            String subcategory = rs.getString("subcategory");
            Integer qty = rs.getInt("quantity");
            Integer price = rs.getInt("price");
    %>

    <div class="row">
        <!-- Product Image -->
        <div class="col-md-5">
            <img src="https://via.placeholder.com/400x400?text=<%= productName %>"
                 class="img-fluid rounded"
                 alt="<%= productName %>">
        </div>

        <!-- Product Details -->
        <div class="col-md-7">
            <div class="card product-card p-4">
                <h3 class="mb-3"><%= productName %></h3>
                <p><strong>Brand:</strong> <%= brand %></p>
                <p><strong>Category:</strong> <%= category %></p>
                <p><strong>Subcategory:</strong> <%= subcategory %></p>
                <p><strong>Available Stock:</strong> <%= qty %></p>
                <p class="price">₹<%= price %></p>

                <div class="mt-4">
                    <a href="AddtoCartController?productId=<%= productId %>" class="btn btn-success btn-lg">Add to Cart 🛒</a>
                    <a href="#" class="btn btn-outline-primary btn-lg">Buy Now</a>
                </div>
            </div>
        </div>
    </div>

    <%  } else { %>
        <div class="alert alert-danger">Product not found.</div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
