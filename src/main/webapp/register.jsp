<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register New Student | Manjusri Portal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-shell">
        <!-- Top Navigation -->
        <nav class="topbar">
            <div class="brand">
                <a href="index.jsp" style="display:flex; align-items:center; gap:12px;">
                    <div class="brand-mark">MS</div>
                    <div>
                        <div class="brand-name">Manjusri Registry</div>
                        <div class="brand-subtitle">Student Management</div>
                    </div>
                </a>
            </div>
            <div class="nav-links">
                <a href="index.jsp" class="nav-link">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                    Home
                </a>
                <a href="viewStudents" class="nav-link">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                    All Students
                </a>
                <a href="register" class="nav-link active">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                    Register
                </a>
            </div>
        </nav>

        <main class="page-content">
            <div class="form-card-container">
                <div class="form-card">
                    <div class="form-header">
                        <h2 class="form-title">Register New Student</h2>
                        <p class="form-sub">Enter the student information below to create a new profile in MongoDB.</p>
                    </div>

                    <%-- Alert Notifications --%>
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert-banner alert-error">
                            <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                            <span><%= request.getAttribute("error") %></span>
                        </div>
                    <% } %>
                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert-banner alert-success">
                            <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                            <span><%= request.getAttribute("success") %></span>
                        </div>
                    <% } %>

                    <form action="register" method="post" class="student-form">
                        <div class="field-group">
                            <label for="name">
                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                                Full Name
                            </label>
                            <input type="text" id="name" name="name" placeholder="e.g. Priya Sharma" required>
                        </div>

                        <div class="field-row">
                            <div class="field-group">
                                <label for="email">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/></svg>
                                    Email Address
                                </label>
                                <input type="email" id="email" name="email" placeholder="priya@example.com" required>
                            </div>
                            <div class="field-group">
                                <label for="phone">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/></svg>
                                    Phone Number
                                </label>
                                <input type="tel" id="phone" name="phone" placeholder="+91 98765 43210" required>
                            </div>
                        </div>

                        <div class="field-row">
                            <div class="field-group">
                                <label for="course">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/></svg>
                                    Course / Major
                                </label>
                                <input type="text" id="course" name="course" placeholder="e.g. B.Tech Computer Science" required>
                            </div>
                            <div class="field-group">
                                <label for="age">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                                    Age
                                </label>
                                <input type="number" id="age" name="age" min="1" max="120" placeholder="20" required>
                            </div>
                        </div>

                        <div class="field-group">
                            <label for="address">
                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
                                Residential Address
                            </label>
                            <textarea id="address" name="address" rows="3" placeholder="Street, City, State, ZIP"></textarea>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary" style="flex: 1;">
                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                                Complete Registration
                            </button>
                            <a href="viewStudents" class="btn btn-ghost">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <footer class="footer">
            <p>Manjusri Student Registration System &bull; Powered by <span class="tech-stack">Java Servlets + MongoDB</span></p>
        </footer>
    </div>
</body>
</html>
