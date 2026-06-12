<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Appointments - HealthCare</title>
  <link rel="stylesheet" href="/css/style.css">
  <style>
    /* Page Hero Background */
    .page-hero {
      background:
        linear-gradient(rgba(0,60,100,0.80), rgba(0,80,130,0.80)),
        url('https://images.unsplash.com/photo-1504813184591-01572f98c85f?w=1600&auto=format')
        center/cover no-repeat;
      padding: 50px 20px;
      text-align: center;
      color: white;
    }

    .page-hero h1 {
      font-size: 2.2rem;
      font-weight: 800;
      margin-bottom: 10px;
    }

    .page-hero p {
      font-size: 1rem;
      opacity: 0.9;
    }

    /* Main content area */
    .content-area {
      background:
        linear-gradient(rgba(240,247,255,0.97), rgba(240,247,255,0.97)),
        url('https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=1600&auto=format')
        center/cover no-repeat fixed;
      min-height: 60vh;
      padding: 40px 20px;
    }

    /* Stats bar */
    .stats-bar {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
      margin-bottom: 30px;
    }

    .stat-box {
      background: white;
      border-radius: 12px;
      padding: 18px 30px;
      text-align: center;
      box-shadow: 0 4px 15px rgba(0,119,182,0.1);
      border-top: 3px solid #00b4d8;
      min-width: 140px;
    }

    .stat-box h3 {
      font-size: 1.8rem;
      font-weight: 900;
      color: #0077b6;
    }

    .stat-box p {
      font-size: 0.85rem;
      color: #888;
      margin-top: 4px;
    }

    /* Book new button area */
    .action-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 24px;
      flex-wrap: wrap;
      gap: 12px;
    }

    .action-bar h2 {
      color: #0077b6;
      font-size: 1.5rem;
      font-weight: 800;
    }

    .btn-book {
      background: linear-gradient(90deg, #0077b6, #00b4d8);
      color: white;
      padding: 12px 28px;
      border-radius: 25px;
      font-weight: 700;
      font-size: 0.95rem;
      transition: all 0.2s;
      display: inline-block;
    }

    .btn-book:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 15px rgba(0,119,182,0.3);
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <span>👤 ${sessionScope.userName}</span>
    <a href="/patient/book" class="btn-primary">+ Book</a>
    <a href="/logout">Logout</a>
  </div>
</nav>

<!-- Page Hero with Hospital Background -->
<div class="page-hero">
  <h1>📋 My Appointments</h1>
  <p>Manage and track all your doctor appointments in one place</p>
</div>

<!-- Main Content Area with Background -->
<div class="content-area">
  <div class="container">

    <!-- Success Message -->
    <c:if test="${param.success == 'booked'}">
      <div class="alert success">
        ✅ Appointment booked successfully!
      </div>
    </c:if>

    <!-- Stats Bar -->
    <div class="stats-bar">
      <div class="stat-box">
        <h3>${appointments.size()}</h3>
        <p>Total Appointments</p>
      </div>
      <div class="stat-box">
        <h3>
          <c:set var="pending" value="0"/>
          <c:forEach var="apt" items="${appointments}">
            <c:if test="${apt.status == 'PENDING'}">
              <c:set var="pending" value="${pending + 1}"/>
            </c:if>
          </c:forEach>
          ${pending}
        </h3>
        <p>Pending</p>
      </div>
      <div class="stat-box">
        <h3>
          <c:set var="completed" value="0"/>
          <c:forEach var="apt" items="${appointments}">
            <c:if test="${apt.status == 'COMPLETED'}">
              <c:set var="completed" value="${completed + 1}"/>
            </c:if>
          </c:forEach>
          ${completed}
        </h3>
        <p>Completed</p>
      </div>
    </div>

    <!-- Action Bar -->
    <div class="action-bar">
      <h2>📅 Your Appointments</h2>
      <a href="/patient/book" class="btn-book">+ New Appointment</a>
    </div>

    <!-- Empty State -->
    <c:if test="${empty appointments}">
      <div class="empty-state">
        <div style="font-size:4rem; margin-bottom:16px;">🏥</div>
        <h3 style="color:#0077b6; margin-bottom:10px;">No Appointments Yet</h3>
        <p>You have not booked any appointments yet.</p>
        <br/>
        <a href="/patient/book" class="btn-book">Book Your First Appointment</a>
      </div>
    </c:if>

    <!-- Appointments Table -->
    <c:if test="${not empty appointments}">
      <div class="table-wrapper">
        <table class="data-table">
          <thead>
            <tr>
              <th>#</th>
              <th>👨‍⚕️ Doctor</th>
              <th>🏥 Specialization</th>
              <th>📅 Date</th>
              <th>🕐 Time</th>
              <th>📌 Status</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="apt" items="${appointments}" varStatus="i">
              <tr>
                <td>${i.count}</td>
                <td><strong>${apt.doctorName}</strong></td>
                <td>${apt.specialization}</td>
                <td>${apt.appointmentDate}</td>
                <td>${apt.timeSlot}</td>
                <td>
                  <span class="badge ${apt.status.toLowerCase()}">
                    ${apt.status}
                  </span>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:if>

  </div>
</div>

<!-- Footer -->
<footer class="footer">
  <p>© 2024 HealthCare Appointment System. All rights reserved. 🏥</p>
</footer>

</body>
</html>