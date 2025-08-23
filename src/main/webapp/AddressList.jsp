<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Addresses</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 15px 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        
        .address-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
        }
        
        .address-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }
        
        .address-label {
            font-weight: 600;
            color: var(--primary-color);
            text-transform: capitalize;
        }
        
        .action-btn {
            padding: 0.35rem 0.75rem;
            font-size: 0.85rem;
            border-radius: 6px;
        }
        
        .empty-state {
            background-color: white;
            border-radius: 10px;
            padding: 3rem;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        
        .address-icon {
            width: 40px;
            height: 40px;
            background-color: rgba(78, 115, 223, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
    </style>
</head>
<body>

<!-- Header Section with Home Button -->
<div class="dashboard-header">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2 class="mb-0"><i class="fas fa-map-marker-alt me-2"></i> My Addresses</h2>
                <p class="mb-0 opacity-75">Manage your saved delivery addresses</p>
            </div>
            <div>
                <a href="CustomerDashboardController" class="btn btn-light me-2">
                    <i class="fas fa-home me-1"></i> Dashboard
                </a>
                <a href="AddressForm.jsp" class="btn btn-outline-light">
                    <i class="fas fa-plus me-1"></i> Add New
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <%
    ResultSet rs = (ResultSet) request.getAttribute("rs");
    if (rs != null) {
    %>
        <div class="row">
            <%
            while (rs.next()) {
                Integer addressId = rs.getInt("addressId");
                String addressLine = rs.getString("addressLine");
                String landmark = rs.getString("landmark");
                String city = rs.getString("city");
                String state = rs.getString("state");
                String pincode = rs.getString("pincode");
                String label = rs.getString("label");
            %>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="address-card p-3 h-100">
                    <div class="d-flex align-items-start mb-3">
                        <div class="address-icon me-3">
                            <i class="fas fa-home"></i>
                        </div>
                        <div>
                            <h5 class="address-label mb-1"><%= label %></h5>
                            <small class="text-muted">ID: <%= addressId %></small>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <p class="mb-1"><strong><%= addressLine %></strong></p>
                        <p class="mb-1 text-muted"><small><%= landmark %></small></p>
                        <p class="mb-1"><%= city %>, <%= state %> - <%= pincode %></p>
                    </div>
                    
                    <div class="d-flex justify-content-end">
                        <a href="AddressEditController?addressId=<%=addressId%>" 
                           class="action-btn btn btn-outline-primary me-2">
                            <i class="fas fa-edit me-1"></i> Edit
                        </a>
                        <a href="AddressDeleteController?addressId=<%=addressId%>" 
                           class="action-btn btn btn-outline-danger"
                           onclick="return confirm('Are you sure you want to delete this address?');">
                            <i class="fas fa-trash-alt me-1"></i> Delete
                        </a>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    <%
    } else {
    %>
        <div class="empty-state">
            <i class="fas fa-map-marked-alt fa-3x mb-3" style="color: var(--primary-color);"></i>
            <h4 class="mb-2">No Addresses Saved</h4>
            <p class="text-muted mb-4">You haven't added any addresses yet</p>
            <a href="AddressForm.jsp" class="btn btn-primary">
                <i class="fas fa-plus me-1"></i> Add Your First Address
            </a>
        </div>
    <%
    }
    %>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>v