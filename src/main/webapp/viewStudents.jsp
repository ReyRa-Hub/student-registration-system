<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentapp.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Directory | Manjusri Portal</title>
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
                <a href="viewStudents" class="nav-link active">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/></svg>
                    All Students
                </a>
                <a href="register" class="nav-link nav-cta">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                    + Register Student
                </a>
            </div>
        </nav>

        <main class="page-content">
            <div class="table-card">
                <!-- Table Header & Controls -->
                <div class="table-toolbar">
                    <div class="table-title-box">
                        <h2>Student Directory</h2>
                        <p>Manage and search registered student records live from MongoDB.</p>
                    </div>

                    <div style="display:flex; align-items:center; gap:12px; flex-wrap:wrap;">
                        <!-- Live Search Bar -->
                        <div class="search-box">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                            <input type="text" id="searchInput" onkeyup="filterStudents()" placeholder="Search name, email, course...">
                        </div>

                        <a href="register" class="btn btn-primary btn-small">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                            New Student
                        </a>
                    </div>
                </div>

                <%-- Feedback Banners --%>
                <%
                    String successMsg = request.getParameter("success");
                    if (successMsg == null) successMsg = (String) request.getAttribute("success");
                    String errorMsg = request.getParameter("error");
                    if (errorMsg == null) errorMsg = (String) request.getAttribute("error");
                %>
                <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
                    <div class="alert-banner alert-error">
                        <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                        <span><%= errorMsg %></span>
                    </div>
                <% } %>
                <% if (successMsg != null && !successMsg.isEmpty()) { %>
                    <div class="alert-banner alert-success">
                        <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                        <span><%= successMsg %></span>
                    </div>
                <% } %>

                <%
                    List<Student> students = (List<Student>) request.getAttribute("students");
                %>

                <% if (students == null || students.isEmpty()) { %>
                    <div class="empty-state">
                        <div class="empty-icon">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/></svg>
                        </div>
                        <h3>No Student Records Found</h3>
                        <p>There are currently no students registered in the MongoDB database.</p>
                        <a href="register" class="btn btn-primary">
                            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                            Register the First Student
                        </a>
                    </div>
                <% } else { %>
                    <div class="table-scroll">
                        <table class="student-table" id="studentTable">
                            <thead>
                                <tr>
                                    <th>Student</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Course</th>
                                    <th>Age</th>
                                    <th>Address</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Student s : students) { 
                                    String initial = (s.getName() != null && !s.getName().trim().isEmpty()) 
                                        ? String.valueOf(s.getName().trim().charAt(0)).toUpperCase() : "S";
                                %>
                                <tr>
                                    <td data-label="Student">
                                        <div class="user-avatar-cell">
                                            <div class="avatar-circle"><%= initial %></div>
                                            <span class="student-name-text"><%= s.getName() %></span>
                                        </div>
                                    </td>
                                    <td data-label="Email"><%= s.getEmail() %></td>
                                    <td data-label="Phone"><%= s.getPhone() %></td>
                                    <td data-label="Course"><span class="tag-course"><%= s.getCourse() %></span></td>
                                    <td data-label="Age"><%= s.getAge() %></td>
                                    <td data-label="Address"><%= (s.getAddress() != null && !s.getAddress().isEmpty()) ? s.getAddress() : "—" %></td>
                                    <td data-label="Actions" style="text-align: right;">
                                        <div class="actions-cell" style="justify-content: flex-end;">
                                            <a class="btn btn-small btn-ghost" href="edit?id=<%= s.getId() %>" title="Edit Student">
                                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                                                Edit
                                            </a>
                                            <a class="btn btn-small btn-danger" href="delete?id=<%= s.getId() %>"
                                               onclick="return confirm('Are you sure you want to permanently delete the student record for <%= s.getName().replace("'", "\\'") %>?');"
                                               title="Delete Student">
                                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                                                Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>
        </main>

        <footer class="footer">
            <p>Manjusri Student Registration System &bull; Powered by <span class="tech-stack">Java Servlets + MongoDB</span></p>
        </footer>
    </div>

    <!-- Client-side Table Search Script -->
    <script>
        function filterStudents() {
            var input = document.getElementById("searchInput");
            var filter = input.value.toLowerCase();
            var table = document.getElementById("studentTable");
            if (!table) return;
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) {
                var tdArray = tr[i].getElementsByTagName("td");
                var match = false;
                for (var j = 0; j < tdArray.length - 1; j++) {
                    if (tdArray[j]) {
                        var textValue = tdArray[j].textContent || tdArray[j].innerText;
                        if (textValue.toLowerCase().indexOf(filter) > -1) {
                            match = true;
                            break;
                        }
                    }
                }
                tr[i].style.display = match ? "" : "none";
            }
        }
    </script>
</body>
</html>
