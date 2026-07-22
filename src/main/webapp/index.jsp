<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration System | Manjusri Portal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="app-shell">
        <!-- Glassmorphic Navigation Bar -->
        <nav class="topbar">
            <div class="brand">
                <div class="brand-mark">MS</div>
                <div>
                    <div class="brand-name">Manjusri Registry</div>
                    <div class="brand-subtitle">Student Management</div>
                </div>
            </div>
            <div class="nav-links">
                <a href="index.jsp" class="nav-link active">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                    Home
                </a>
                <a href="viewStudents" class="nav-link">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                    All Students
                </a>
                <a href="register" class="nav-link nav-cta">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                    + Register Student
                </a>
            </div>
        </nav>

        <!-- Executive Hero Section -->
        <header class="hero">
            <div class="hero-badge">
                <span class="pulse-dot"></span>
                Java Servlets &bull; MongoDB Database Integration
            </div>
            <h1 class="hero-title">
                Next-Gen Student Record <br>
                <span class="gradient-text">Management System</span>
            </h1>
            <p class="hero-sub">
                Seamlessly register, explore, update, and manage student enrollment data with high-speed performance backed by MongoDB.
            </p>
            <div class="hero-actions">
                <a class="btn btn-primary" href="register">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                    Register New Student
                </a>
                <a class="btn btn-ghost" href="viewStudents">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/></svg>
                    View Directory
                </a>
            </div>
        </header>

        <!-- Dynamic System Statistics Metrics Banner -->
        <section class="stats-banner">
            <div class="stat-card">
                <div class="stat-icon">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                </div>
                <div class="stat-info">
                    <div class="stat-value">Instant Sync</div>
                    <div class="stat-label">Real-time DB Records</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--accent-emerald);">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <div class="stat-info">
                    <div class="stat-value">MongoDB</div>
                    <div class="stat-label">Document Data Storage</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon" style="color: var(--accent-cyan);">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M13 10V3L4 14h7v7l9-11h-7z"/></svg>
                </div>
                <div class="stat-info">
                    <div class="stat-value">Java Web Engine</div>
                    <div class="stat-label">Servlet Architecture</div>
                </div>
            </div>
        </section>

        <!-- Feature Capabilities Grid -->
        <section class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon-wrapper">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                </div>
                <h3>Quick Enrollment</h3>
                <p>Register student profiles effortlessly with personal, contact, course, and address details in an intuitive form.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon-wrapper" style="color: var(--accent-cyan); background: rgba(6, 182, 212, 0.12); border-color: rgba(6, 182, 212, 0.25);">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3 10h18M3 14h18m-9-4v8m-7 0h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                </div>
                <h3>Directory &amp; Search</h3>
                <p>Browse through student records with real-time client-side search and course identification badges.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon-wrapper" style="color: var(--accent-emerald); background: rgba(16, 185, 129, 0.12); border-color: rgba(16, 185, 129, 0.25);">
                    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/></svg>
                </div>
                <h3>Edit &amp; Manage</h3>
                <p>Update student records instantly or remove obsolete entries with a single click and confirmation safety.</p>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <p>Manjusri Student Registration System &bull; Powered by <span class="tech-stack">Java Servlets + MongoDB</span></p>
        </footer>
    </div>
</body>
</html>
