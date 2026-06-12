<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register - HealthCare</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <a href="login">Login</a>
  </div>
</nav>

<div class="auth-container">
  <div class="auth-box">
    <h2>🏥 Patient Registration</h2>

    <!-- Error Message -->
    <% if(request.getAttribute("error") != null) { %>
      <div class="alert error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="register" method="post">
      <div class="form-group">
        <label>Full Name</label>
        <input type="text" name="name" placeholder="Enter your full name" required/>
      </div>
      <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required/>
      </div>
      <div class="form-group">
        <label>Phone</label>
        <input type="text" name="phone" placeholder="Enter your phone number" required/>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Create a password" required/>
      </div>
      <button type="submit" class="btn-primary full-width">Create Account</button>
    </form>

    <p class="auth-link">Already registered? <a href="login">Login here</a></p>
  </div>
</div>

</body>
</html>