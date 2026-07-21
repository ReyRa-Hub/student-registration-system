<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-shell">
        <nav class="topbar">
            <div class="brand">
                <span class="brand-mark">SR</span>
                <span class="brand-name">Student Registry</span>
            </div>
        </nav>

        <header class="hero">
            <p class="hero-eyebrow">Java Servlets &middot; MongoDB</p>
            <h1 class="hero-title">Manage student records<br>without the paperwork.</h1>
            <p class="hero-sub">Register, browse, edit and remove student records backed by a MongoDB collection.</p>
            <div class="hero-actions">
                <a class="btn btn-primary" href="register">Register a Student</a>
                <a class="btn btn-ghost" href="viewStudents">View All Students</a>
            </div>
        </header>

        <section class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">01</div>
                <h3>Register</h3>
                <p>Capture name, contact details, course and address in a single clean form.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">02</div>
                <h3>Browse</h3>
                <p>See every record in a sortable table pulled live from MongoDB.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">03</div>
                <h3>Edit &amp; Delete</h3>
                <p>Update or remove any record in a couple of clicks.</p>
            </div>
        </section>

        <footer class="footer">
            <p>Built with Java Servlets + MongoDB</p>
        </footer>
    </div>
</body>
</html>
