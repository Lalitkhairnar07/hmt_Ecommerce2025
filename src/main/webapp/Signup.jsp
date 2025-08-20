<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | Premium</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-dark: #4f46e5;
            --primary-light: #6366f1;
            --secondary: #10b981;
            --dark: #1e293b;
            --light: #f8fafc;
            --gray: #94a3b8;
            --danger: #ef4444;
        }
        
        body {
        	
            font-family: 'Inter', sans-serif;
            background-color: #f1f5f9;
            min-height: 100vh;
            display: flex;
            align-items: center;
            color: var(--dark);
            width:100%;
            height: 100%;
        }
        
        .auth-container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 
                        0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        
        .auth-hero {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-light));
            padding: 4rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .auth-hero h2 {
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }
        
        .auth-hero p {
            opacity: 0.9;
            margin-bottom: 2rem;
        }
        
        .auth-features {
            list-style: none;
            padding: 0;
        }
        
        .auth-features li {
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }
        
        .auth-features i {
            margin-right: 0.75rem;
            color: var(--secondary);
        }
        
        .auth-form {
            padding: 4rem;
        }
        
        .form-header {
            margin-bottom: 2.5rem;
        }
        
        .form-header h1 {
            font-weight: 700;
            font-size: 2rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }
        
        .form-header p {
            color: var(--gray);
        }
        
        .form-control {
            height: 48px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            padding: 0.5rem 1rem;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--primary-dark), var(--primary-light));
            border: none;
            height: 48px;
            font-weight: 600;
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            transition: all 0.3s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }
        
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .divider-text {
            padding: 0 1rem;
            color: var(--gray);
            font-size: 0.875rem;
        }
        
        .social-login .btn {
            height: 48px;
            border-radius: 8px;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }
        
        .social-login .btn:hover {
            transform: translateY(-2px);
        }
        
        .social-login .btn i {
            margin-right: 0.75rem;
            font-size: 1.25rem;
        }
        
        .text-link {
            color: var(--primary-dark);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s;
        }
        
        .text-link:hover {
            color: var(--primary-light);
            text-decoration: underline;
        }
        
        .input-group-text {
            background-color: #f8fafc;
            border-color: #e2e8f0;
        }
        
        .password-toggle {
            cursor: pointer;
            background: transparent;
            border: none;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            z-index: 5;
        }
        
        .password-toggle:hover {
            color: var(--dark);
        }
        
        .password-wrapper {
            position: relative;
        }
        
        .error-message {
            font-size: 0.875rem;
            color: var(--danger);
            margin-top: 0.25rem;
        }
        
        @media (max-width: 992px) {
            .auth-hero {
                display: none;
            }
            
            .auth-form {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="auth-container">
            <div class="row g-0">
                <!-- Hero Section -->
                <div class="col-lg-5 d-none d-lg-block">
                    <div class="auth-hero">
                        <h2>Join Our Community</h2>
                        <p>Sign up to access premium features and connect with like-minded professionals.</p>
                        
                        <ul class="auth-features">
                            <li><i class="bi bi-check-circle-fill"></i> Access to exclusive content</li>
                            <li><i class="bi bi-check-circle-fill"></i> Personalized recommendations</li>
                            <li><i class="bi bi-check-circle-fill"></i> Priority customer support</li>
                            <li><i class="bi bi-check-circle-fill"></i> Advanced analytics dashboard</li>
                        </ul>
                    </div>
                </div>
                
                <!-- Form Section -->
                <div class="col-lg-7">
                    <div class="auth-form">
                        <div class="form-header">
                            <h1>Create Account</h1>
                            <p>Get started with your free account today</p>
                        </div>
                        
                        <form action="SignupController" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" 
                                           value="${username}" placeholder="Enter username" >
                                    <div class="error-message">${FirstNameError}</div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           value="${email}" placeholder="your@email.com" >
                                    <div class="error-message">${EmailError}</div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="contactNumber" class="form-label">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text">+91</span>
                                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber" 
                                           value="${contactNumber}" placeholder="(555) 123-4567">
                                </div>
                                <div class="error-message">${ContactNumberError}</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-select" id="gender" name="gender" >
                                    <option selected disabled value="">Select gender</option>
                                    <option value="Male" <c:if test="${gender == 'Male'}">selected</c:if>>Male</option>
                                    <option value="Female" <c:if test="${gender == 'Female'}">selected</c:if>>Female</option>
                                    <option value="Other" <c:if test="${gender == 'Other'}">selected</c:if>>Other</option>
                                    <option value="Prefer not to say">Prefer not to say</option>
                                </select>
                                <div class="error-message">${GenderError}</div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="password-wrapper">
                                        <input type="password" class="form-control" id="password" name="password" 
                                               placeholder="••••••••" >
                                        <button type="button" class="password-toggle" id="togglePassword">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>
                                    <div class="error-message">${PasswordError}</div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="confirm-password" class="form-label">Confirm Password</label>
                                    <div class="password-wrapper">
                                        <input type="password" class="form-control" id="confirm-password" 
                                               name="confirmPassword" placeholder="••••••••" >
                                        <button type="button" class="password-toggle" id="toggleConfirmPassword">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </div>
                                    <div class="error-message">${ConfirmPasswordError}</div>
                                </div>
                            </div>
                            
                            <div class="mb-4 form-check">
                                <input type="checkbox" class="form-check-input" id="terms" >
                                <label class="form-check-label" for="terms">
                                    I agree to the <a href="#" class="text-link">Terms of Service</a> and 
                                    <a href="#" class="text-link">Privacy Policy</a>
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100 mb-4">
                                Create Account <i class="bi bi-arrow-right"></i>
                            </button>
                            
                            <div class="divider">
                                <span class="divider-text">OR CONTINUE WITH</span>
                            </div>
                            
                            <div class="row social-login g-2 mb-4">
                                <div class="col-md-6">
                                    <button type="button" class="btn btn-outline-primary w-100">
                                        <i class="bi bi-google"></i> Google
                                    </button>
                                </div>
                                <div class="col-md-6">
                                    <button type="button" class="btn btn-outline-primary w-100">
                                        <i class="bi bi-facebook"></i> Facebook
                                    </button>
                                </div>
                            </div>
                            
                            <p class="text-center">Already have an account? 
                                <a href="Login.jsp" class="text-link">Login in</a>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Password Toggle Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('#togglePassword');
            const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
            const password = document.querySelector('#password');
            const confirmPassword = document.querySelector('#confirm-password');
            
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.querySelector('i').classList.toggle('bi-eye');
                this.querySelector('i').classList.toggle('bi-eye-slash');
            });
            
            toggleConfirmPassword.addEventListener('click', function() {
                const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPassword.setAttribute('type', type);
                this.querySelector('i').classList.toggle('bi-eye');
                this.querySelector('i').classList.toggle('bi-eye-slash');
            });
        });
    </script>
</body>
</html>