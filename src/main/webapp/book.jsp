<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.healthcare.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>Book Appointment - HealthCare</title>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <span>Hello, <%= ((User)session.getAttribute("loggedUser")).getName() %></span>
    <a href="/patient/appointments">My Appointments</a>
    <a href="/logout">Logout</a>
  </div>
</nav>

<div class="container">
  <h2>📅 Book an Appointment</h2>

  <!-- Error Message -->
  <c:if test="${not empty error}">
    <div class="alert error">${error}</div>
  </c:if>

  <form action="/patient/book" method="post" class="form-card">

    <div class="form-group">
      <label>Select Doctor</label>
      <select name="doctorId" required>
        <option value="">-- Choose a Doctor --</option>
        <c:forEach var="doc" items="${doctors}">
          <option value="${doc.id}">
            ${doc.name} — ${doc.specialization}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label>Appointment Date</label>
      <input type="date" name="appointmentDate" required
             min="<%= java.time.LocalDate.now().toString() %>"/>
    </div>

    <div class="form-group">
      <label>Time Slot</label>
      <select name="timeSlot" required>
        <option value="">-- Select Time --</option>
        <option>09:00 AM</option>
        <option>09:30 AM</option>
        <option>10:00 AM</option>
        <option>10:30 AM</option>
        <option>11:00 AM</option>
        <option>11:30 AM</option>
        <option>02:00 PM</option>
        <option>02:30 PM</option>
        <option>03:00 PM</option>
        <option>03:30 PM</option>
        <option>04:00 PM</option>
      </select>
    </div>

    <div class="form-group">
      <label>Reason / Notes (optional)</label>
      <textarea name="notes" rows="3"
                placeholder="Describe your symptoms..."></textarea>
    </div>

    <button type="submit" class="btn-primary">Confirm Booking</button>
  </form>
</div>

</body>
</html>