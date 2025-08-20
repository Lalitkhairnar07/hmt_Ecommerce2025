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
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #2e59d9;
            --text-dark: #5a5c69;
            --text-light: #858796;
        }
        
        body {
            background-color: var(--secondary-color);
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }

        .header-section {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .product-card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: none;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .product-title {
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--text-dark);
        }

        .product-info {
            font-size: 0.9rem;
            color: var(--text-light);
        }

        .price {
            color: #28a745;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-edit {
            background-color: rgba(78, 115, 223, 0.1);
            color: var(--primary-color);
            border: 1px solid rgba(78, 115, 223, 0.3);
            border-radius: 6px;
            padding: 6px 10px;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
        }

        .btn-edit:hover {
            background-color: rgba(78, 115, 223, 0.2);
            color: var(--primary-color);
            border-color: rgba(78, 115, 223, 0.5);
        }

        .btn-delete {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: 1px solid rgba(220, 53, 69, 0.3);
            border-radius: 6px;
            padding: 6px 10px;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
        }

        .btn-delete:hover {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
            border-color: rgba(220, 53, 69, 0.5);
        }

        .badge-category {
            background-color: #e1f0ff;
            color: var(--primary-color);
            font-weight: 600;
        }

        .badge-brand {
            background-color: #e8f5e9;
            color: #2e7d32;
            font-weight: 600;
        }

        .empty-state {
            background-color: white;
            border-radius: 10px;
            padding: 3rem;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .empty-state i {
            font-size: 3rem;
            color: var(--text-light);
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<div class="header-section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2><i class="fas fa-boxes me-2"></i> Product Management</h2>
                <p class="mb-0">View and manage all products in your inventory</p>
            </div>
            <div>
                <a href="AdminHome.jsp" class="btn btn-light me-2">
                    <i class="fas fa-home me-1"></i> Home
                </a>
                <a href="AddProduct.jsp" class="btn btn-outline-light">
                    <i class="fas fa-plus me-1"></i> Add Product
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <div class="row g-4">
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

        <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card product-card h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <h5 class="product-title mb-0"><%= productName %></h5>
                        <span class="badge badge-brand"><%= brand %></span>
                    </div>
                    
                    <span class="badge badge-category mb-3"><%= category %></span>
                    
                    <div class="product-info mb-2">
                        <div><i class="fas fa-tags me-2"></i> <%= subcategory %></div>
                        <div><i class="fas fa-cubes me-2"></i> Stock: <%= qty %></div>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <p class="price mb-0">₹<%= price %></p>
                        <div class="action-buttons">
                            <a href="DBProductEditController?productId=<%=productId%>" 
                               class="btn-edit"
                               data-bs-toggle="tooltip" title="Edit Product">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="DBProductDeleteController?productId=<%=productId%>" 
                               class="btn-delete"
                               data-bs-toggle="tooltip" title="Delete Product"
                               onclick="return confirm('Are you sure you want to delete this product?');">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        } else {
        %>
            <div class="col-12">
                <div class="empty-state">
                    <i class="fas fa-box-open"></i>
                    <h4 class="mb-3">No Products Found</h4>
                    <p class="text-muted mb-4">There are currently no products in your inventory.</p>
                    <a href="AddProduct.jsp" class="btn btn-primary">
                        <i class="fas fa-plus me-1"></i> Add Your First Product
                    </a>
                </div>
            </div>
        <%
        }
        %>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Enable tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>
</body>
</html>