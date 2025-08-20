<%@page import="com.util.DBConnection"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #2e59d9;
            --text-dark: #5a5c69;
            --text-light: #858796;
            --success-color: #1cc88a;
            --danger-color: #e74a3b;
        }
        
        body {
            background-color: var(--secondary-color);
            font-family: 'Poppins', sans-serif;
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .card {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
        }
        
        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
        }
        
        .table thead th {
            border-bottom: 2px solid #e3e6f0;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.7rem;
            letter-spacing: 0.5px;
            color: var(--text-light);
        }
        
        .status-badge {
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 700;
            border-radius: 0.25rem;
        }
        
        .status-active {
            background-color: rgba(28, 200, 138, 0.1);
            color: var(--success-color);
        }
        
        .status-inactive {
            background-color: rgba(231, 74, 59, 0.1);
            color: var(--danger-color);
        }
        
        .action-btn {
            width: 30px;
            height: 30px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: all 0.2s;
        }
        
        .btn-view {
            background-color: rgba(78, 115, 223, 0.1);
            color: var(--primary-color);
        }
        
        .btn-view:hover {
            background-color: rgba(78, 115, 223, 0.2);
        }
        
        .btn-edit {
            background-color: rgba(253, 203, 110, 0.1);
            color: #e17055;
        }
        
        .btn-edit:hover {
            background-color: rgba(253, 203, 110, 0.2);
        }
        
        .btn-delete {
            background-color: rgba(231, 74, 59, 0.1);
            color: var(--danger-color);
        }
        
        .btn-delete:hover {
            background-color: rgba(231, 74, 59, 0.2);
        }
        
        .password-cell {
            max-width: 120px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .empty-state {
            padding: 3rem;
            text-align: center;
            background-color: white;
            border-radius: 0.35rem;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<div class="dashboard-header">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2 class="mb-0"><i class="fas fa-users me-2"></i> Customer Management</h2>
                <p class="mb-0 opacity-75">View and manage all registered customers</p>
            </div>
            <div>
                <a href="AdminHome.jsp" class="btn btn-light me-2">
                    <i class="fas fa-home me-1"></i> Dashboard
                </a>
                <a href="AddNewUser.jsp" class="btn btn-outline-light">
                    <i class="fas fa-user-plus me-1"></i> Add Customer
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <div class="card">
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-list-ol me-2"></i> Customer List</h6>
            <div class="d-flex">
                <input type="text" class="form-control form-control-sm me-2" placeholder="Search customers..." style="width: 200px;">
                <button class="btn btn-sm btn-primary">
                    <i class="fas fa-search me-1"></i> Search
                </button>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Contact</th>
                            <th>Created</th>
                            <th>Status</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        ResultSet rs = null;
                        try {
                            Connection conn = DBConnection.getConnection();
                            PreparedStatement pstmt = conn.prepareStatement("select * from users where role = ?");
                            pstmt.setString(1, "customer");
                            rs = pstmt.executeQuery();
                            
                            if (rs != null) {
                                while (rs.next()) {
                                    Integer userId = rs.getInt("userId");
                                    String userName = rs.getString("username");
                                    String gender = rs.getString("gender");
                                    String email = rs.getString("email");
                                    String password = rs.getString("password");
                                    String contactNumber = rs.getString("contactNumber");
                                    String createdAt = rs.getString("createdAt");
                                    String active = rs.getString("active");
                    %>
                        <tr>
                            <td><%= userId %></td>
                            <td><strong><%= userName %></strong></td>
                            <td><%= gender %></td>
                            <td><%= email %></td>
                            <td class="password-cell" title=""><%= password %></td>
                            <td><%= contactNumber %></td>
                            <td><small><%= createdAt %></small></td>
                            <td>
                                <span class="status-badge <%= "1".equals(active) ? "status-active" : "status-inactive" %>">
                                    <%= "1".equals(active) ? "Active" : "Inactive" %>
                                </span>
                            </td>
                            
                        </tr>
                    <%
                                }
                            } else {
                    %>
                        <tr>
                            <td colspan="9" class="text-center py-4">
                                <div class="empty-state">
                                    <i class="fas fa-user-slash fa-3x text-muted mb-3"></i>
                                    <h5 class="mb-2">No Customers Found</h5>
                                    <p class="text-muted mb-4">There are currently no customers registered in the system</p>
                                    <a href="AddNewUser.jsp" class="btn btn-primary">
                                        <i class="fas fa-user-plus me-1"></i> Add New Customer
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <%
                            }
                            
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </tbody>
                </table>
            </div>
            
            
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>