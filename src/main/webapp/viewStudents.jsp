<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentapp.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Students</title>
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
                <a href="register">Register</a>
            </div>
        </nav>

        <main class="page-content">
            <div class="table-card">
                <div class="table-card-head">
                    <h2 class="form-title">All Students</h2>
                    <a href="register" class="btn btn-primary btn-small">+ New Student</a>
                </div>

                <%-- Feedback banners from query params (redirects) or request attributes (forwards) --%>
                <%
                    String successMsg = request.getParameter("success");
                    if (successMsg == null) successMsg = (String) request.getAttribute("success");
                    String errorMsg = request.getParameter("error");
                    if (errorMsg == null) errorMsg = (String) request.getAttribute("error");
                %>
                <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
                    <div class="alert-banner" style="background:rgba(220,38,38,0.12);color:#dc2626;border:1px solid rgba(220,38,38,0.25);margin-bottom:1rem;padding:0.75rem 1rem;border-radius:0.5rem;"><%= errorMsg %></div>
                <% } %>
                <% if (successMsg != null && !successMsg.isEmpty()) { %>
                    <div class="alert-banner" style="background:rgba(22,163,74,0.12);color:#16a34a;border:1px solid rgba(22,163,74,0.25);margin-bottom:1rem;padding:0.75rem 1rem;border-radius:0.5rem;"><%= successMsg %></div>
                <% } %>

                <%
                    List<Student> students = (List<Student>) request.getAttribute("students");
                %>

                <% if (students == null || students.isEmpty()) { %>
                    <div class="empty-state">
                        <p>No students registered yet.</p>
                        <a href="register" class="btn btn-primary">Register the first student</a>
                    </div>
                <% } else { %>
                    <div class="table-scroll">
                        <table class="student-table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Course</th>
                                    <th>Age</th>
                                    <th>Address</th>
                                    <th class="actions-col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Student s : students) { %>
                                <tr>
                                    <td data-label="Name"><%= s.getName() %></td>
                                    <td data-label="Email"><%= s.getEmail() %></td>
                                    <td data-label="Phone"><%= s.getPhone() %></td>
                                    <td data-label="Course"><span class="tag"><%= s.getCourse() %></span></td>
                                    <td data-label="Age"><%= s.getAge() %></td>
                                    <td data-label="Address"><%= s.getAddress() %></td>
                                    <td data-label="Actions" class="actions-col">
                                        <a class="btn btn-small btn-ghost" href="edit?id=<%= s.getId() %>">Edit</a>
                                        <a class="btn btn-small btn-danger" href="delete?id=<%= s.getId() %>"
                                           onclick="return confirm('Delete this student record?');">Delete</a>
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
            <p>Built with Java Servlets + MongoDB</p>
        </footer>
    </div>
</body>
</html>
