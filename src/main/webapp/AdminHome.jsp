<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

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
    
    .sidebar {
        min-height: 100vh;
        background: linear-gradient(180deg, var(--primary-color), var(--accent-color));
        color: white;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        transition: all 0.3s;
    }
    
    .sidebar-brand {
        height: 4.375rem;
        text-decoration: none;
        font-size: 1.2rem;
        font-weight: 800;
        padding: 1.5rem 1rem;
        text-align: center;
        letter-spacing: 0.05rem;
        z-index: 1;
    }
    
    .sidebar-divider {
        border-top: 1px solid rgba(255, 255, 255, 0.15);
        margin: 0 1rem 1rem;
    }
    
    .sidebar-heading {
        padding: 0 1rem;
        font-weight: 800;
        font-size: 0.65rem;
        color: rgba(255, 255, 255, 0.4);
        text-transform: uppercase;
        letter-spacing: 0.13em;
    }
    
    .sidebar-link {
        color: rgba(255, 255, 255, 0.8);
        text-decoration: none;
        display: block;
        padding: 0.75rem 1rem;
        border-radius: 0.35rem;
        margin: 0 0.5rem 0.25rem;
        font-weight: 600;
        transition: all 0.3s;
    }
    
    .sidebar-link:hover {
        color: white;
        background-color: rgba(255, 255, 255, 0.2);
    }
    
    .sidebar-link i {
        margin-right: 0.5rem;
        width: 20px;
        text-align: center;
    }
    
    .sidebar-link.active {
        color: white;
        background-color: rgba(255, 255, 255, 0.2);
    }
    
    .main-content {
        padding: 2rem;
    }
    
    .topbar {
        height: 4.375rem;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        background-color: white;
    }
    
    .dashboard-card {
        border-left: 0.25rem solid var(--primary-color);
        border-radius: 0.35rem;
        background-color: white;
        box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
        transition: transform 0.3s;
    }
    
    .dashboard-card:hover {
        transform: translateY(-5px);
    }
    
    .card-icon {
        font-size: 2rem;
        opacity: 0.3;
    }
    
    .welcome-banner {
        background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
        color: white;
        border-radius: 0.35rem;
        padding: 1.5rem;
        margin-bottom: 2rem;
    }
    
    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: var(--primary-color);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }
</style>
</head>
<body>

<!-- 🔹 Top Navbar -->
<nav class="navbar navbar-expand-lg topbar mb-4 static-top">
  <div class="container-fluid d-flex justify-content-between align-items-center">
    
    <!-- Left: Toggle button for mobile -->
    <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggle">
      <i class="fa fa-bars"></i>
    </button>
    
    <!-- Center: Admin info -->
    <div class="d-flex align-items-center">
      <div class="user-avatar me-2">AD</div>
      <span class="d-none d-lg-inline text-gray-600 small">Admin User</span>
    </div>
    
    <!-- Right: Logout button -->
    <form action="LogoutController" method="post" class="m-0">
        <button type="submit" class="btn btn-danger btn-sm">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </form>
    
  </div>
</nav>

<div class="container-fluid">
    <div class="row">
        
        <!-- 🔹 Sidebar -->
        <div class="col-md-3 col-lg-2 sidebar p-0">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-text mx-3">Admin Panel</div>
            </a>
            
            <hr class="sidebar-divider">
            
            <div class="sidebar-heading">Management</div>
            
            <a href="AddNewUser.jsp" class="sidebar-link">
                <i class="fas fa-user-plus"></i>
                <span>Add New User</span>
            </a>
            
            <a href="AddProduct.jsp" class="sidebar-link">
                <i class="fas fa-box-open"></i>
                <span>Add Product</span>
            </a>
            
            <hr class="sidebar-divider">
            
            <div class="sidebar-heading">Lists</div>
            
            <a href="DBProductList" class="sidebar-link">
                <i class="fas fa-boxes"></i>
                <span>Product List</span>
            </a>
            
            <a href="DBUserListController" class="sidebar-link">
                <i class="fas fa-users"></i>
                <span>User List</span>
            </a>
            
            <a href="DBAdminListController" class="sidebar-link">
                <i class="fas fa-user-shield"></i>
                <span>Admin List</span>
            </a>
            
            <a href="CustomerList.jsp" class="sidebar-link active">
                <i class="fas fa-user-tie"></i>
                <span>Customer List</span>
            </a>
        </div>
        
        
        <!-- 🔹 Main Content -->
        <div class="col-md-9 col-lg-10 main-content">
            <div class="welcome-banner">
                <h1 class="h3 mb-0">Welcome back, Admin!</h1>
                <p class="mb-0">Here's what's happening with your store today.</p>
            </div>
            
            <div class="row mb-4">
                <!-- Total Products -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card card h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Total Products</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalProducts}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-boxes card-icon text-primary"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Total Users -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card card h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Total Users</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalUser}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-users card-icon text-success"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Total Customers -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card card h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Total Customers</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalCustomer}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-user-tie card-icon text-info"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Total Orders -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="dashboard-card card h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        Total Orders</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalOrders}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list card-icon text-warning"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
			<!-- Recent Orders Card -->
			<div class="card shadow mb-4">
			    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			        <h6 class="m-0 font-weight-bold text-primary">Recent Orders</h6>
			        <div class="dropdown no-arrow">
				           <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" 
				               data-bs-toggle="dropdown" aria-expanded="false">
				               <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
				           </a>
				           <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="dropdownMenuLink">
				               <li><a class="dropdown-item" href="#">Refresh</a></li>
				               <li><a class="dropdown-item" href="#">Export</a></li>
				           </ul>
				     </div>
				 </div>
			     <div class="card-body">
			        <div class="list-group list-group-flush">
			            <%
				             ResultSet rs = (ResultSet) request.getAttribute("recentOrders");
				                if (rs != null) {
				                    while (rs.next()) {
				                        String orderId = "#ORD-" + rs.getInt("orderId");
				                        String customer = rs.getString("username");
				                        String orderDate = rs.getString("orderDate"); 
				                        double total = rs.getDouble("price");
				            %>
				                <div class="list-group-item d-flex align-items-center">
				                    <div class="me-3 text-warning">
				                        <i class="fas fa-shopping-cart fa-fw"></i>
				                    </div>
				                    <div>
				                        <div class="small text-gray-500"><%= orderDate %></div>
				                        <span class="font-weight-bold">New order received</span> - <%= orderId %> 
				                        ( <%= customer %>, ₹<%= total %> )
				                    </div>
				                </div>
				            <%
				                    }
				                }
			            %>
			        </div>
			    </div>
			</div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Toggle sidebar on mobile
    document.getElementById('sidebarToggle').addEventListener('click', function() {
        document.querySelector('.sidebar').classList.toggle('d-none');
    });
</script>

</body>
</html>
