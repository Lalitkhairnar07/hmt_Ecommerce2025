<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --bg-dark: #121212;
            --card-dark: #1f1f1f;
            --primary: #4f46e5;
            --accent: #10b981;
            --gray: #a0aec0;
            --danger: #ef4444;
            --text-light: #f8fafc;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-light);
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .auth-container {
            background-color: var(--card-dark);
            max-width: 1100px;
            width: 100%;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .auth-hero {
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: white;
            padding: 3rem;
        }

        .auth-form {
            padding: 3rem;
            background-color: var(--card-dark);
        }

        .form-control, .form-select {
            background-color: #2d2d2d;
            color: white;
            border: 1px solid #3d3d3d;
            border-radius: 8px;
        }

        .form-control::placeholder {
            color: #bbb;
        }

        .form-label {
            color: #e2e8f0;
        }

        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--accent));
            border: none;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn-primary:hover {
            opacity: 0.9;
        }

        .text-link {
            color: var(--accent);
            text-decoration: none;
        }

        .text-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: var(--danger);
            font-size: 0.875rem;
        }

        .divider {
            border-bottom: 1px solid #444;
            margin: 1.5rem 0;
        }

        .social-login .btn {
            background-color: #2d2d2d;
            color: white;
            border: 1px solid #444;
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 10px;
            background: none;
            border: none;
            transform: translateY(-50%);
            color: #ccc;
            cursor: pointer;
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
<div class="container px-3">
    <div class="auth-container row g-0">
        <!-- Left Side -->
        <div class="col-lg-5 d-none d-lg-block">
            <div class="auth-hero h-100 d-flex flex-column justify-content-center">
                <h2 class="fw-bold mb-3">Welcome to Premium</h2>
                <p class="mb-4">Sign up now and unlock powerful tools and insights for your success.</p>
                <ul class="list-unstyled">
                    <li class="mb-2"><i class="bi bi-check-circle-fill me-2"></i> Dark Mode Experience</li>
                    <li class="mb-2"><i class="bi bi-check-circle-fill me-2"></i> Analytics Dashboard</li>
                    <li class="mb-2"><i class="bi bi-check-circle-fill me-2"></i> Priority Support</li>
                </ul>
            </div>
        </div>

        <!-- Right Side -->
        <div class="col-lg-7">
            <div class="auth-form">
                <h1 class="fw-bold mb-3">Create New User Account</h1>
                <p class="mb-4 text-muted">Start your journey in just a few steps.</p>

                <form action="NewUserController" method="post">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" value="${username}" placeholder="Enter username">
                            <div class="error-message">${FirstNameError}</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" value="${email}" placeholder="you@example.com">
                            <div class="error-message">${EmailError}</div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <div class="input-group">
                            <span class="input-group-text bg-dark border-secondary text-white">+91</span>
                            <input type="tel" class="form-control" name="contactNumber" value="${contactNumber}" placeholder="1234567890">
                        </div>
                        <div class="error-message">${ContactNumberError}</div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <select name="gender" class="form-select">
                                <option disabled selected value="">Select Gender</option>
                                <option value="Male" <c:if test="${gender == 'Male'}">selected</c:if>>Male</option>
                                <option value="Female" <c:if test="${gender == 'Female'}">selected</c:if>>Female</option>
                                <option value="Other" <c:if test="${gender == 'Other'}">selected</c:if>>Other</option>
                            </select>
                            <div class="error-message">${GenderError}</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Role</label>
                            <select name="role" class="form-select">
                                <option disabled selected value="">Select Role</option>
                                <option value="admin" <c:if test="${role == 'admin'}">selected</c:if>>Admin</option>
                                <option value="customer" <c:if test="${role == 'customer'}">selected</c:if>>Customer</option>
                            </select>
                            <div class="error-message">${RoleError}</div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Password</label>
                            <div class="password-wrapper">
                                <input type="password" class="form-control" id="password" name="password" placeholder="••••••••">
                                <button type="button" class="password-toggle" id="togglePassword">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                            <div class="error-message">${PasswordError}</div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Confirm Password</label>
                            <div class="password-wrapper">
                                <input type="password" class="form-control" id="confirm-password" name="confirmPassword" placeholder="••••••••">
                                <button type="button" class="password-toggle" id="toggleConfirmPassword">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </div>
                            <div class="error-message">${ConfirmPasswordError}</div>
                        </div>
                    </div>

                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" id="terms" name="terms">
                        <label class="form-check-label" for="terms">
                            I agree to the <a href="#" class="text-link">Terms</a> and <a href="#" class="text-link">Privacy</a>
                        </label>
                        <div class="error-message">${TermsError}</div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mb-3">
                        Update Account <i class="bi bi-arrow-right ms-2"></i>
                    </button>

                    <div class="divider"></div>

                    <div class="row social-login mb-3">
                        <div class="col-6">
                            <button type="button" class="btn w-100"><i class="bi bi-google me-2"></i> Google</button>
                        </div>
                        <div class="col-6">
                            <button type="button" class="btn w-100"><i class="bi bi-facebook me-2"></i> Facebook</button>
                        </div>
                    </div>

                    <!-- <p class="text-center">Already have an account? <a href="Login.jsp" class="text-link">Log in</a></p> -->
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelector('#togglePassword').addEventListener('click', function () {
            const pwd = document.querySelector('#password');
            const type = pwd.type === 'password' ? 'text' : 'password';
            pwd.type = type;
            this.querySelector('i').classList.toggle('bi-eye');
            this.querySelector('i').classList.toggle('bi-eye-slash');
        });

        document.querySelector('#toggleConfirmPassword').addEventListener('click', function () {
            const pwd = document.querySelector('#confirm-password');
            const type = pwd.type === 'password' ? 'text' : 'password';
            pwd.type = type;
            this.querySelector('i').classList.toggle('bi-eye');
            this.querySelector('i').classList.toggle('bi-eye-slash');
        });
    });
</script>
</body>
</html>



