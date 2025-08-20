<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product | E-Commerce Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary: #6c5ce7;
            --primary-dark: #5649c0;
            --secondary: #fd79a8;
            --dark: #2d3436;
            --darker: #1e2224;
            --light: #f5f6fa;
            --gray: #636e72;
        }
        
        body {
            height: 100vh;
            overflow: hidden;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background-color: var(--darker);
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(108, 92, 231, 0.08) 0%, transparent 25%),
                radial-gradient(circle at 80% 70%, rgba(253, 121, 168, 0.08) 0%, transparent 25%);
            animation: bgPulse 20s infinite alternate;
        }
        
        @keyframes bgPulse {
            0% { background-position: 20% 30%, 80% 70%; }
            50% { background-position: 30% 40%, 70% 60%; }
            100% { background-position: 10% 20%, 90% 80%; }
        }
        
        .ecom-card {
            background: rgba(30, 34, 36, 0.9);
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.05);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            max-height: 95vh;
            overflow-y: auto;
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
        }
        
        .card-header::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        }
        
        .card-body {
            padding: 1.75rem;
        }
        
        .ecom-icon {
            color: var(--primary);
            margin-right: 8px;
            font-size: 1.1rem;
        }
        
        .form-label {
            font-weight: 500;
            color: var(--light);
            font-size: 0.9rem;
            margin-bottom: 0.4rem;
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 0.5rem 0.75rem;
            font-size: 0.9rem;
            transition: all 0.2s;
            background-color: rgba(45, 52, 54, 0.7);
            color: var(--light);
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(108, 92, 231, 0.25);
            background-color: rgba(45, 52, 54, 0.9);
            color: white;
        }
        
        .form-control::placeholder {
            color: var(--gray);
        }
        
        .input-group-text {
            background-color: rgba(45, 52, 54, 0.7);
            border-color: rgba(255, 255, 255, 0.1);
            color: var(--gray);
        }
        
        .btn-ecom {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border: none;
            border-radius: 8px;
            padding: 0.6rem 1.25rem;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }
        
        .btn-ecom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(108, 92, 231, 0.3);
        }
        
        .btn-ecom::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
            transition: 0.5s;
        }
        
        .btn-ecom:hover::before {
            left: 100%;
        }
        
        /* Custom scrollbar for card */
        .ecom-card::-webkit-scrollbar {
            width: 6px;
        }
        
        .ecom-card::-webkit-scrollbar-track {
            background: rgba(255,255,255,0.05);
            border-radius: 3px;
        }
        
        .ecom-card::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 3px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }
        }
        
        @media (max-width: 576px) {
            body {
                padding: 0;
            }
            
            .ecom-card {
                border-radius: 0;
                max-height: 100vh;
                box-shadow: none;
                border: none;
            }
        }
        
        .text-error {
    		color: #ff7675; /* soft red */
   			font-size: 0.85rem;
    		margin-top: 0.25rem;
    		display: block;
		}
		
    </style>
</head>

<body class="d-flex align-items-center">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-8 col-md-10">
                <div class="ecom-card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="bi bi-plus-circle"></i> Add New Product</h5>
                    </div>
                    <div class="card-body">
                        <form action="DBProductController" method="post">
                            <!-- Product Info Row -->
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="productName" class="form-label">
                                        <i class="bi bi-tag ecom-icon"></i>Product Name
                                    </label>
                                    <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name">
                                	<span class="text-error">${productNameError}</span>
                                </div>
                                <div class="col-md-6">
                                    <label for="brand" class="form-label">
                                        <i class="bi bi-shop ecom-icon"></i>Brand
                                    </label>
                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Enter brand">
                                    <span class="text-error">${brandError}</span>
                                </div>
                            </div>
                            
                            <!-- Category Row -->
                            <div class="row g-3 mt-2">
                                <div class="col-md-6">
                                    <label for="category" class="form-label">
                                        <i class="bi bi-list-ul ecom-icon"></i>Category
                                    </label>
                                    <select class="form-select" id="category" name="category">
                                        <option value="">Select category</option>
                                        <option value="Electronics">Electronics</option>
                                        <option value="Fashion">Fashion</option>
                                        <option value="Home & Garden">Home & Garden</option>
                                        <option value="Sports">Sports</option>
                                    </select>
                                    <span class="text-error">${categoryError}</span>
                                </div>
                                <div class="col-md-6">
                                    <label for="subcategory" class="form-label">
                                        <i class="bi bi-diagram-2 ecom-icon"></i>Subcategory
                                    </label>
                                    <input type="text" class="form-control" id="subcategory" name="subcategory" placeholder="Enter subcategory">
                                	<span class="text-error">${subcategoryError}</span>
                                </div>
                            </div>
                            
                            <!-- Pricing Row -->
                            <div class="row g-3 mt-2">
                                <div class="col-md-6">
                                    <label for="quantity" class="form-label">
                                        <i class="bi bi-box ecom-icon"></i>Stock Quantity
                                    </label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" min="1" placeholder="Available quantity">
                                	<span class="text-error">${quantityError}</span>
                                </div>
                                <div class="col-md-6">
                                    <label for="price" class="form-label">
                                        <i class="bi bi-currency-dollar ecom-icon"></i>Price
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <input type="number" class="form-control" id="price" name="price" min="0" step="0.01" placeholder="0.00">
                                    	<span class="text-error">${priceError}</span>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="d-grid mt-4">
                                <button type="submit" class="btn btn-ecom text-white">
                                    <i class="bi bi-cloud-upload"></i> Add Product
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>