<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    :root {
        --primary-color: #6c5ce7;
        --secondary-color: #f8f9fa;
        --accent-color: #a29bfe;
        --dark-color: #2d3436;
        --light-color: #f5f6fa;
        --success-color: #00b894;
        --warning-color: #fdcb6e;
        --text-light: #7f8c8d;
    }
    
    body {
        background-color: var(--light-color);
        font-family: 'Poppins', sans-serif;
    }
    
    .glass-sidebar {
        min-height: 100vh;
        background: rgba(108, 92, 231, 0.9);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        border-right: 1px solid rgba(255, 255, 255, 0.18);
    }
    
    .sidebar-header {
        padding: 1.5rem 1rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }
    
    .sidebar-menu {
        padding: 1rem;
    }
    
    .nav-item {
        margin-bottom: 0.5rem;
    }
    
    .nav-link {
        color: white;
        border-radius: 8px;
        padding: 0.75rem 1rem;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
    }
    
    .nav-link:hover, .nav-link.active {
        background-color: rgba(255, 255, 255, 0.2);
        transform: translateX(5px);
    }
    
    .nav-link i {
        width: 24px;
        text-align: center;
        margin-right: 12px;
        font-size: 1.1rem;
    }
    
    .main-content {
        padding: 2rem;
    }
    
    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
    }
    
    .user-profile {
        display: flex;
        align-items: center;
    }
    
    .user-avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: var(--accent-color);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1rem;
        color: white;
        font-weight: bold;
        font-size: 1.2rem;
    }
    
    .welcome-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.05);
        padding: 2rem;
        margin-bottom: 2rem;
    }
    
    .quick-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }
    
    .stat-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.05);
        padding: 1.5rem;
        transition: all 0.3s ease;
        border-left: 4px solid var(--primary-color);
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card i {
        font-size: 1.75rem;
        color: var(--primary-color);
        margin-bottom: 1rem;
    }
    
    .stat-card h3 {
        font-size: 1.75rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
    }
    
    .stat-card p {
        color: var(--text-light);
        margin-bottom: 0;
    }
    
    .recent-activity {
        background: white;
        border-radius: 12px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.05);
        padding: 1.5rem;
    }
    
    .activity-item {
        display: flex;
        padding: 1rem 0;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
    }
    
    .activity-item:last-child {
        border-bottom: none;
    }
    
    .activity-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: rgba(108, 92, 231, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 1rem;
        color: var(--primary-color);
    }
    
    .activity-content {
        flex: 1;
    }
    
    .activity-time {
        font-size: 0.8rem;
        color: var(--text-light);
    }
    
    @media (max-width: 768px) {
        .glass-sidebar {
            min-height: auto;
            width: 100%;
        }
        
        .quick-stats {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Glass Sidebar Navigation -->
        <div class="col-md-3 col-lg-2 glass-sidebar p-0">
            <div class="sidebar-header">
                <h4 class="text-white mb-0"><i class="fas fa-user-circle me-2"></i> Customer Portal</h4>
            </div>
            <div class="sidebar-menu">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fas fa-tachometer-alt"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddressForm.jsp">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>New Address</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddressDataController">
                            <i class="fas fa-address-book"></i>
                            <span>View Addresses</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ProductListController">
                            <i class="fas fa-box-open"></i>
                            <span>Product List</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddtocartList">
                            <i class="fas fa-shopping-cart"></i>
                            <span>My Cart</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 main-content">
            <div class="dashboard-header">
                <div>
                    <h2>Customer Dashboard</h2>
                    <p class="text-muted">Welcome to your personal dashboard</p>
                </div>
                <div class="user-profile">
                    <div class="user-avatar">C</div>
                    <div>
                        <h5 class="mb-0">Customer Name</h5>
                        <small class="text-muted">Premium Member</small>
                    </div>
                </div>
            </div>
            
            <div class="welcome-card">
                <h2>Welcome Back, Customer!</h2>
                <p class="lead">Here's what's happening with your account today.</p>
            </div>
            
            <div class="quick-stats">
                <div class="stat-card">
                    <i class="fas fa-box"></i>
                    <h3></h3>
                    <p>Total Orders</p>
                    <p>${totalOrders}</p>
                </div>
                <a href="AddtocartList" style="text-decoration: none; color: inherit;">
    				<div class="stat-card">
        			<i class="fas fa-shopping-cart"></i>
        			<p>Items in Cart</p>
        			<p>${totalCart}</p>
    				</div>
				</a>
               <a href="AddressDataController" style="text-decoration: none; color: inherit;">
    				<div class="stat-card">
        			<i class="fas fa-map-marker-alt"></i>
        			<p>Saved Addresses</p>
        			<p></p>
    				</div>
			   </a>

                <div class="stat-card">
                    <i class="fas fa-star"></i>
                    <h3></h3>
                    <p>Your Rating</p>
                    <p></p>
                </div>
            </div>
            
            <div class="recent-activity">
                <h4 class="mb-4"><i class="fas fa-clock me-2"></i>Recent Activity</h4>
                
                <%
    				ResultSet rs = (ResultSet) request.getAttribute("cartActivityRS");
    				if (rs != null) {
        				while (rs.next()) {
				%>
    				<div class="activity-item d-flex align-items-start mb-3">
        				<div class="activity-icon me-3">
            				<i class="fas fa-shopping-cart"></i>
        				</div>
        				<div class="activity-content">
            				<h6><%= rs.getString("title") %></h6>
            				<p><%= rs.getString("message") %></p>
            				<div class="activity-time">Cart ID: <%= rs.getInt("dateInfo") %></div>
        				</div>
    				</div>
				<%
        			}
    			}
				%>
                
                <div class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="activity-content">
                        <h6>New address added</h6>
                        <p>You added a new delivery address</p>
                        <div class="activity-time">1 day ago</div>
                    </div>
                </div>
                
                <%
    				ResultSet orders = (ResultSet) request.getAttribute("orders");
    				if (orders != null) {
        				while (orders.next()) {
            				int orderId = orders.getInt("orderId");
            				String orderDate = orders.getString("orderDate");
            				int price = orders.getInt("price");	
				%>
				
    				<div class="activity-item">
        				<div class="activity-icon">
            				<i class="fas fa-box-open"></i>
        				</div>
        				<div class="activity-content">
            				<h6>Order <%= orderId %></h6>
            					<p>Your order of ₹<%= price %> has been placed successfully</p>
           	 					<div class="activity-time"><%= orderDate %></div>
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

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>