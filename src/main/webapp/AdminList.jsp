<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin List</title>
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
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        
        .header-section {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        
        .table-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            padding: 1.5rem;
        }
        
        .table thead th {
            border-bottom-width: 1px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.8rem;
            background-color: #f8f9fa;
        }
        
        .status-active {
            color: #28a745;
            font-weight: 600;
        }
        
        .status-inactive {
            color: #dc3545;
            font-weight: 600;
        }
        
        .action-btns .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.8rem;
        }
        
        .password-cell {
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        .admin-badge {
            background-color: #e1f0ff;
            color: var(--primary-color);
            font-weight: 600;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<!-- Header Section with Home Button -->
<div class="header-section">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2><i class="fas fa-user-shield me-2"></i> Admin Management</h2>
                <p class="mb-0">View and manage all system administrators</p>
            </div>
            <div>
                <a href="AdminHome.jsp" class="btn btn-light me-2">
                    <i class="fas fa-home me-1"></i> Dashboard
                </a>
                <a href="AddNewUser.jsp" class="btn btn-outline-light">
                    <i class="fas fa-user-plus me-1"></i> Add Admin
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <div class="table-container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="mb-0"><i class="fas fa-list-ol me-2"></i>Admin List</h4>
            <div class="d-flex">
                <input type="text" class="form-control form-control-sm me-2" placeholder="Search admins..." style="width: 200px;">
                <button class="btn btn-sm btn-primary">
                    <i class="fas fa-search me-1"></i> Search
                </button>
            </div>
        </div>
        
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Contact</th>
                        <th>Created</th>
                        <th>Role</th>
                        <th>Status</th>
                        
                    </tr>
                </thead>
                <tbody>
                <%
                ResultSet rs = (ResultSet) request.getAttribute("rs");
                if (rs != null) {
                    while (rs.next()) {
                        Integer userId = rs.getInt("userId");
                        String userName = rs.getString("username");
                        String gender = rs.getString("gender");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String contactNumber = rs.getString("contactNumber");
                        String createdAt = rs.getString("createdAt");
                        String role = rs.getString("role");
                        String active = rs.getString("active");
                %>
                    <tr>
                        <td><%= userId %></td>
                        <td><strong><%= userName %></strong></td>
                        <td><%= gender %></td>
                        <td><%= email %></td>
                        <td class="password-cell" title="<%= password %>">••••••••</td>
                        <td><%= contactNumber %></td>
                        <td><small><%= createdAt %></small></td>
                        <td><span class="admin-badge"><%= role %></span></td>
                        <td class="<%= "1".equals(active) ? "status-active" : "status-inactive" %>">
                            <%= "1".equals(active) ? "Active" : "Inactive" %>
                        </td>
                        
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="10" class="text-center text-muted py-4">
                            <i class="fas fa-user-times fa-2x mb-3"></i>
                            <h5>No administrators found</h5>
                            <p>There are currently no admin users in the system</p>
                            <a href="AddNewUser.jsp" class="btn btn-primary btn-sm">
                                <i class="fas fa-user-plus me-1"></i> Add New Admin
                            </a>
                        </td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>
        </div>
      
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>