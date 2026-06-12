<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login - HealthCare</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <a href="register">Register</a>
  </div>
</nav>

<div class="auth-container">
  <div class="auth-box">
    <h2>🔐 Login</h2>

    <!-- Error Message -->
    <% if(request.getAttribute("error") != null) { %>
      <div class="alert error"><%= request.getAttribute("error") %></div>
    <% } %>

    <!-- Success Message -->
    <% if(request.getParameter("success") != null) { %>
      <div class="alert success">Registration successful! Please login.</div>
    <% } %>

    <form action="login" method="post">
      <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required/>
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required/>
      </div>
      <button type="submit" class="btn-primary full-width">Login</button>
    </form>

    <p class="auth-link">No account? <a href="register">Register here</a></p>
  </div>
</div>

</body>
</html>