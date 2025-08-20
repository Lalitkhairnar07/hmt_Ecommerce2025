<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product | E-Commerce Admin</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #6c5ce7;
            --secondary-color: #a29bfe;
            --dark-color: #2d3436;
            --light-color: #f5f6fa;
            --success-color: #00b894;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        
        .card-header {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            border-bottom: none;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.25rem rgba(108, 92, 231, 0.25);
        }
        
        .btn-update {
            background-color: var(--primary-color);
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }
        
        .btn-update:hover {
            background-color: #5649c0;
            transform: translateY(-2px);
        }
        
        .form-label {
            font-weight: 500;
            color: var(--dark-color);
        }
        
        .animation-delay-1 {
            animation-delay: 0.1s;
        }
        
        .animation-delay-2 {
            animation-delay: 0.2s;
        }
        
        .animation-delay-3 {
            animation-delay: 0.3s;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card animate__animated animate__fadeInUp">
                    <div class="card-header py-3">
                        <h4 class="mb-0"><i class="fas fa-edit me-2"></i>Update Product Details</h4>
                    </div>
                    <div class="card-body p-4">
                        <form action="DBProductUpdateController" method="post">
                        
                        <!-- Hidden field for productId -->
                        <input type="hidden" name="productId" value="${productId}">
                        
                            <!-- Product Name -->
                            <div class="mb-3 animate__animated animate__fadeIn animation-delay-1">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name" value="${productName}">
                            </div>
                            
                            <div class="row">
                                <!-- Brand -->
                                <div class="col-md-6 mb-3 animate__animated animate__fadeIn animation-delay-2">
                                    <label for="brand" class="form-label">Brand</label>
                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Enter brand" value="${brand}">
                                </div>
                                
                                <!-- Category -->
                                <div class="col-md-6 mb-3 animate__animated animate__fadeIn animation-delay-2">
                                    <label for="category" class="form-label">Category</label>
                                    <input type="text" class="form-control" id="category" name="category" placeholder="Enter category" value="${category}">
                                </div>
                            </div>
                            
                            <div class="row">
                                <!-- Sub Category -->
                                <div class="col-md-6 mb-3 animate__animated animate__fadeIn animation-delay-3">
                                    <label for="subCategory" class="form-label">Sub Category</label>
                                    <input type="text" class="form-control" id="subCategory" name="subCategory" placeholder="Enter sub category" value="${subcategory}">
                                </div>
                                
                                <!-- Quantity -->
                                <div class="col-md-6 mb-3 animate__animated animate__fadeIn animation-delay-3">
                                    <label for="quantity" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity" value="${quantity}">
                                </div>
                            </div>
                            
                            <!-- Price -->
                            <div class="mb-4 animate__animated animate__fadeIn animation-delay-1">
                                <label for="price" class="form-label">Price (₹)</label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" id="price" name="price" placeholder="Enter price" step="0.01" value="${price}">
                                </div>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="d-flex justify-content-between animate__animated animate__fadeIn animation-delay-2">
                                <button type="button" class="btn btn-outline-secondary">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </button>
                                <button type="submit" class="btn btn-update text-white">
                                    <i class="fas fa-save me-2"></i>Update Product
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS for animations -->
    <script>
        // Add animation classes on load
        document.addEventListener('DOMContentLoaded', function() {
            const elements = document.querySelectorAll('.animate__animated');
            elements.forEach((el, index) => {
                // Add delay based on index
                el.style.animationDelay = `${index * 0.1}s`;
            });
        });
    </script>
</body>
</html>