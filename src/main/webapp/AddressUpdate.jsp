<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Address | Address Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #3a4f8a;
            --secondary-color: #2c3e6b;
            --accent-color: #4a6baf;
            --light-bg: #f8fafc;
            --dark-text: #2d3748;
            --border-radius: 10px;
        }
        
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-y: auto;
            background-color: var(--light-bg);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--dark-text);
            line-height: 1.6;
        }
        
        .container-wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .form-container {
            flex: 1;
            display: flex;
            align-items: center;
            padding: 1rem 0;
        }
        
        .form-card {
            width: 100%;
            max-width: 750px;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            border: none;
            margin: 0 auto;
        }
        
        .form-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 1.75rem 2rem;
            color: white;
            position: relative;
        }
        
        .form-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #4a6baf, #6bd6ff);
        }
        
        .form-body {
            padding: 2rem;
            background-color: white;
        }
        
        .form-title {
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 0.25rem;
        }
        
        .form-subtitle {
            opacity: 0.9;
            font-weight: 400;
            font-size: 0.95rem;
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            transition: all 0.2s ease;
            font-size: 0.95rem;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(74, 107, 175, 0.15);
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            color: var(--dark-text);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.2s;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }
        
        .btn-primary:active {
            transform: translateY(0);
        }
        
        .section-divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #e2e8f0, transparent);
            margin: 1.75rem 0;
            border: none;
        }
        
        .form-check-input {
            width: 1.2em;
            height: 1.2em;
            margin-top: 0.15em;
        }
        
        .form-check-label {
            font-weight: 500;
        }
        
        .input-group-text {
            background-color: #f1f5f9;
            border-color: #e2e8f0;
        }
        
        @media (max-width: 768px) {
            .form-body {
                padding: 1.5rem;
            }
            
            .form-header {
                padding: 1.5rem;
            }
            
            .form-container {
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container-wrapper">
        <div class="form-container">
            <div class="container">
                <div class="form-card">
                    <div class="form-header">
                        <h2 class="form-title"><i class="bi bi-house-gear me-2"></i>Update Address</h2>
                        <p class="form-subtitle mb-0">Please fill in all required details accurately</p>
                    </div>
                    
                    <div class="form-body">
                        <form action="AddressUpdateController" method="post">
                            <!-- Address Information Section -->
                            
                            <input type="hidden" name="addressId" value="${addressId}">
                            
                            <div class="row g-3">
                            
                                <div class="col-md-12">
                                    <label for="addressLine" class="form-label">Full Address*</label>
                                    <input type="text" class="form-control" id="addressLine" name="addressLine"  value="${addressLine}"
                                           placeholder="House no., Building, Street, Area">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="landmark" class="form-label">Landmark (Optional)</label>
                                    <input type="text" class="form-control" id="landmark" name="landmark" value="${landmark}"
                                           placeholder="Nearby prominent location">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="city" class="form-label">City*</label>
                                    <input type="text" class="form-control" id="city" name="city" value="${city}" 
                                           placeholder="Enter your city">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="state" class="form-label">State/Province*</label>
                                    <input type="text" class="form-control" id="state" name="state" value="${state}" 
                                           placeholder="Enter your state">
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="pincode" class="form-label">Postal/Zip Code*</label>
                                    <input type="text" class="form-control" id="pincode" name="pincode" value="${pincode}" 
                                           placeholder="Enter postal code">
                                </div>
                            </div>
                            
                            <hr class="section-divider">
                            
                            <!-- Address Settings Section -->
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="label" class="form-label">Address Type*</label>
                                    <select class="form-select" name="label" id="label" required>
                                        <option value="${label}" selected disabled>Select address type</option>
                                        <option value="home">Home</option>
                                        <option value="work">Work</option>
                                        <option value="other">Other</option>
                                    </select>
                                </div>
                                
                             <!-- 
                                <div class="col-md-6">
                                    <div class="h-100 d-flex align-items-center">
                                        <div class="form-check form-switch ps-0">
                                            <input class="form-check-input ms-0 me-2" type="checkbox" id="isDefault" name="isDefault" value="true">
                                            <label class="form-check-label fw-semibold" for="isDefault">
                                                Set as Default Address
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                 -->
                            </div>
                            
                            <hr class="section-divider">
                            
                            <!-- Form Actions -->
                            <div class="d-flex justify-content-between align-items-center">
                                <button type="reset" class="btn btn-outline-secondary">
                                    <i class="bi bi-arrow-counterclockwise me-2"></i>Reset
                                </button>
                                <button type="submit" class="btn btn-primary px-4">
                                    <i class="bi bi-save me-2"></i>Update Address
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>