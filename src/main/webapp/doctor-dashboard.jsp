<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Doctor Dashboard - HealthCare</title>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <span>Dr. ${sessionScope.userName}</span>
    <a href="/logout">Logout</a>
  </div>
</nav>

<div class="container">
  <h2>👨‍⚕️ My Patient Appointments</h2>

  <!-- Empty State -->
  <c:if test="${empty appointments}">
    <div class="empty-state">
      <p>No appointments scheduled yet.</p>
    </div>
  </c:if>

  <!-- Appointments Table -->
  <c:if test="${not empty appointments}">
    <div class="table-wrapper">
      <table class="data-table">
        <thead>
          <tr>
            <th>#</th>
            <th>Patient Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Notes</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="apt" items="${appointments}" varStatus="i">
            <tr>
              <td>${i.count}</td>
              <td>${apt.patientName}</td>
              <td>${apt.appointmentDate}</td>
              <td>${apt.timeSlot}</td>
              <td>${apt.notes}</td>
              <td>
                <span class="badge ${apt.status.toLowerCase()}">
                  ${apt.status}
                </span>
              </td>
              <td>
                <!-- Update Status Form -->
                <c:if test="${apt.status == 'PENDING'}">
                  <form action="/doctor/dashboard" method="post"
                        style="display:inline;">
                    <input type="hidden" name="appointmentId"
                           value="${apt.id}"/>
                    <select name="status" class="status-select">
                      <option value="COMPLETED">Completed</option>
                      <option value="CANCELLED">Cancelled</option>
                    </select>
                    <button type="submit" class="btn-small">Update</button>
                  </form>
                </c:if>
                <c:if test="${apt.status != 'PENDING'}">
                  <span style="color:#888;">Done</span>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </c:if>

</div>

</body>
</html>