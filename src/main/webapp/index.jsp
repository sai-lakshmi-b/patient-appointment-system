<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>HealthCare - Book Doctor Appointments</title>
  <link rel="stylesheet" href="/css/style.css">
  <style>
    /* Hero with hospital background */
    .hero {
      background:
        linear-gradient(rgba(0,60,100,0.70), rgba(0,80,130,0.70)),
        url('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=1600&auto=format')
        center/cover no-repeat;
    }

    /* Auth background */
    .section-bg {
      background:
        linear-gradient(rgba(0,60,100,0.85), rgba(0,80,130,0.85)),
        url('https://images.unsplash.com/photo-1538108149393-fbbd81895907?w=1600&auto=format')
        center/cover no-repeat;
      padding: 60px 20px;
      text-align: center;
      color: white;
    }

    .section-bg h2 {
      font-size: 2rem;
      font-weight: 800;
      margin-bottom: 12px;
    }

    .section-bg p {
      font-size: 1.05rem;
      opacity: 0.9;
      margin-bottom: 24px;
    }

    /* Doctor cards section */
    .doctors-section {
      background:
        linear-gradient(rgba(240,247,255,0.96), rgba(240,247,255,0.96)),
        url('https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=1600&auto=format')
        center/cover no-repeat;
      padding: 60px 30px;
      text-align: center;
    }

    .doctors-section h2 {
      color: #0077b6;
      font-size: 2rem;
      font-weight: 800;
      margin-bottom: 36px;
    }

    .doctor-cards {
      display: flex;
      justify-content: center;
      gap: 24px;
      flex-wrap: wrap;
    }

    .doctor-card {
      background: white;
      border-radius: 16px;
      padding: 28px 24px;
      width: 200px;
      box-shadow: 0 4px 20px rgba(0,119,182,0.12);
      border-bottom: 4px solid #00b4d8;
      transition: transform 0.2s;
    }

    .doctor-card:hover {
      transform: translateY(-5px);
    }

    .doctor-icon {
      font-size: 3rem;
      margin-bottom: 12px;
    }

    .doctor-card h4 {
      color: #0077b6;
      margin-bottom: 6px;
      font-size: 1rem;
    }

    .doctor-card p {
      color: #888;
      font-size: 0.85rem;
    }

    /* Stats section */
    .stats-section {
      background:
        linear-gradient(rgba(0,80,130,0.88), rgba(0,100,160,0.88)),
        url('https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=1600&auto=format')
        center/cover no-repeat;
      padding: 60px 20px;
      text-align: center;
      color: white;
    }

    .stats {
      display: flex;
      justify-content: center;
      gap: 60px;
      flex-wrap: wrap;
    }

    .stat-item h3 {
      font-size: 2.8rem;
      font-weight: 900;
      color: #90e0ef;
    }

    .stat-item p {
      font-size: 1rem;
      opacity: 0.9;
      margin-top: 4px;
    }

    /* Testimonial section */
    .testimonial-section {
      background: #f0f7ff;
      padding: 60px 30px;
      text-align: center;
    }

    .testimonial-section h2 {
      color: #0077b6;
      font-size: 2rem;
      font-weight: 800;
      margin-bottom: 36px;
    }

    .testimonials {
      display: flex;
      justify-content: center;
      gap: 24px;
      flex-wrap: wrap;
    }

    .testimonial-card {
      background: white;
      border-radius: 16px;
      padding: 28px;
      width: 280px;
      box-shadow: 0 4px 20px rgba(0,119,182,0.1);
      border-left: 4px solid #00b4d8;
      text-align: left;
    }

    .testimonial-card p {
      color: #555;
      font-size: 0.95rem;
      font-style: italic;
      margin-bottom: 16px;
    }

    .testimonial-card h5 {
      color: #0077b6;
      font-size: 0.9rem;
    }

    .stars {
      color: #f4a261;
      font-size: 1rem;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar">
  <div class="brand">🏥 HealthCare</div>
  <div class="nav-links">
    <a href="login">Login</a>
    <a href="register" class="btn-primary">Register</a>
  </div>
</nav>

<!-- Hero Section with Hospital Background -->
<div class="hero">
  <h1>Your Health Is Our Priority</h1>
  <p>Book doctor appointments online — easy, fast, and reliable. Get the best specialists at your fingertips.</p>
  <a href="register" class="btn-primary">Get Started Free →</a>
</div>

<!-- Features Section -->
<div class="features">
  <div class="feature-card">
    <h3>👨‍⚕️ Expert Doctors</h3>
    <p>Choose from specialists across multiple departments.</p>
    <ul>
      <li>🫀 Cardiology</li>
      <li>🧴 Dermatology</li>
      <li>🦴 Orthopedics</li>
      <li>🧠 Neurology</li>
      <li>👶 Pediatrics</li>
    </ul>
    <a href="register" class="btn-primary full-width">Book Now</a>
  </div>
  <div class="feature-card">
    <h3>📅 Easy Booking</h3>
    <p>Book your appointment in less than 2 minutes.</p>
    <ul>
      <li>✅ Choose your doctor</li>
      <li>✅ Pick a date</li>
      <li>✅ Select a time slot</li>
      <li>✅ Confirm booking</li>
      <li>✅ Instant confirmation</li>
    </ul>
    <a href="register" class="btn-primary full-width">Get Started</a>
  </div>
  <div class="feature-card">
    <h3>📋 Track Status</h3>
    <p>View and manage all your appointments easily.</p>
    <ul>
      <li>📌 View all bookings</li>
      <li>📌 Check appointment date</li>
      <li>📌 See doctor details</li>
      <li>📌 Track PENDING status</li>
      <li>📌 View COMPLETED visits</li>
    </ul>
    <a href="login" class="btn-primary full-width">View Status</a>
  </div>
</div>

<!-- Stats Section with Hospital Background -->
<div class="stats-section">
  <div class="stats">
    <div class="stat-item">
      <h3>500+</h3>
      <p>Happy Patients</p>
    </div>
    <div class="stat-item">
      <h3>50+</h3>
      <p>Expert Doctors</p>
    </div>
    <div class="stat-item">
      <h3>10+</h3>
      <p>Specializations</p>
    </div>
    <div class="stat-item">
      <h3>24/7</h3>
      <p>Online Booking</p>
    </div>
  </div>
</div>

<!-- Doctors Section -->
<div class="doctors-section">
  <h2>Our Specializations</h2>
  <div class="doctor-cards">
    <div class="doctor-card">
      <div class="doctor-icon">🫀</div>
      <h4>Cardiology</h4>
      <p>Heart & Blood Vessels</p>
    </div>
    <div class="doctor-card">
      <div class="doctor-icon">🧠</div>
      <h4>Neurology</h4>
      <p>Brain & Nervous System</p>
    </div>
    <div class="doctor-card">
      <div class="doctor-icon">🦴</div>
      <h4>Orthopedics</h4>
      <p>Bones & Joints</p>
    </div>
    <div class="doctor-card">
      <div class="doctor-icon">🧴</div>
      <h4>Dermatology</h4>
      <p>Skin & Hair Care</p>
    </div>
    <div class="doctor-card">
      <div class="doctor-icon">👶</div>
      <h4>Pediatrics</h4>
      <p>Child Healthcare</p>
    </div>
    <div class="doctor-card">
      <div class="doctor-icon">👁️</div>
      <h4>Ophthalmology</h4>
      <p>Eye Care</p>
    </div>
  </div>
</div>

<!-- How It Works with Background -->
<div class="how-it-works">
  <h2>How It Works</h2>
  <div class="steps">
    <div class="step">
      <div class="step-icon">1️⃣</div>
      <h4>Register</h4>
      <p>Create your free patient account</p>
    </div>
    <div class="step">
      <div class="step-icon">2️⃣</div>
      <h4>Choose Doctor</h4>
      <p>Select from expert specialists</p>
    </div>
    <div class="step">
      <div class="step-icon">3️⃣</div>
      <h4>Book Slot</h4>
      <p>Pick your preferred time</p>
    </div>
    <div class="step">
      <div class="step-icon">4️⃣</div>
      <h4>Visit Doctor</h4>
      <p>Get treated on time</p>
    </div>
  </div>
</div>

<!-- Testimonials Section -->
<div class="testimonial-section">
  <h2>What Our Patients Say</h2>
  <div class="testimonials">
    <div class="testimonial-card">
      <div class="stars">⭐⭐⭐⭐⭐</div>
      <p>"Booking was so easy! I got an appointment with the cardiologist within minutes. Highly recommended!"</p>
      <h5>— Priya S., Patient</h5>
    </div>
    <div class="testimonial-card">
      <div class="stars">⭐⭐⭐⭐⭐</div>
      <p>"The system is very user friendly. I could track my appointment status easily. Great experience!"</p>
      <h5>— Rahul M., Patient</h5>
    </div>
    <div class="testimonial-card">
      <div class="stars">⭐⭐⭐⭐⭐</div>
      <p>"No more waiting in long queues. I simply booked online and visited the doctor on time. Amazing!"</p>
      <h5>— Anita K., Patient</h5>
    </div>
  </div>
</div>

<!-- Register CTA Section -->
<div class="section-bg">
  <h2>Ready to Book Your Appointment?</h2>
  <p>Join thousands of patients who trust our healthcare system.</p>
  <a href="register" class="btn-primary">Register Now →</a>
</div>

<!-- Footer -->
<footer class="footer">
  <p>© 2024 HealthCare Appointment System. All rights reserved. 🏥</p>
</footer>

</body>
</html>