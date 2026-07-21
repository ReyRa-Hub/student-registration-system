<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Student</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-shell">
        <nav class="topbar">
            <div class="brand">
                <a href="index.jsp" style="text-decoration:none; display:flex; align-items:center; gap:0.6rem; color:inherit;">
                    <span class="brand-mark">SR</span>
                    <span class="brand-name">Student Registry</span>
                </a>
            </div>
            <div class="nav-links">
                <a href="index.jsp">Home</a>
                <a href="viewStudents">All Students</a>
            </div>
        </nav>

        <main class="page-content">
            <div class="form-card">
                <h2 class="form-title">Register a New Student</h2>
                <p class="form-sub">Fill in the details below to add a record.</p>

                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert-banner" style="background:rgba(220,38,38,0.12);color:#dc2626;border:1px solid rgba(220,38,38,0.25);"><%= request.getAttribute("error") %></div>
                <% } %>
                <% if (request.getAttribute("success") != null) { %>
                    <div class="alert-banner" style="background:rgba(22,163,74,0.12);color:#16a34a;border:1px solid rgba(22,163,74,0.25);"><%= request.getAttribute("success") %></div>
                <% } %>

                <form action="register" method="post" class="student-form">
                    <div class="field-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" placeholder="e.g. Priya Sharma" required>
                    </div>

                    <div class="field-row">
                        <div class="field-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="priya@example.com" required>
                        </div>
                        <div class="field-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone" placeholder="+91 98765 43210" required>
                        </div>
                    </div>

                    <div class="field-row">
                        <div class="field-group">
                            <label for="course">Course</label>
                            <input type="text" id="course" name="course" placeholder="e.g. B.Tech CSE" required>
                        </div>
                        <div class="field-group">
                            <label for="age">Age</label>
                            <input type="number" id="age" name="age" min="1" max="120" placeholder="20" required>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3" placeholder="Street, City, State"></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Register Student</button>
                        <a href="viewStudents" class="btn btn-ghost">View Students</a>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">
            <p>Built with Java Servlets + MongoDB</p>
        </footer>
    </div>
</body>
</html>
