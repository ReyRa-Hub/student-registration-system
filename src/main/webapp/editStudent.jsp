<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.studentapp.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
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
            <%
                Student student = (Student) request.getAttribute("student");
            %>
            <% if (student == null) { %>
                <div class="table-card">
                    <div class="empty-state">
                        <p>Student not found.</p>
                        <a href="viewStudents" class="btn btn-primary">Back to list</a>
                    </div>
                </div>
            <% } else { %>
            <div class="form-card">
                <h2 class="form-title">Edit Student</h2>
                <p class="form-sub">Update the record and save your changes.</p>

                <form action="update" method="post" class="student-form">
                    <input type="hidden" name="id" value="<%= student.getId() %>">

                    <div class="field-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" value="<%= student.getName() %>" required>
                    </div>

                    <div class="field-row">
                        <div class="field-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>
                        </div>
                        <div class="field-group">
                            <label for="phone">Phone</label>
                            <input type="tel" id="phone" name="phone" value="<%= student.getPhone() %>" required>
                        </div>
                    </div>

                    <div class="field-row">
                        <div class="field-group">
                            <label for="course">Course</label>
                            <input type="text" id="course" name="course" value="<%= student.getCourse() %>" required>
                        </div>
                        <div class="field-group">
                            <label for="age">Age</label>
                            <input type="number" id="age" name="age" min="1" max="120" value="<%= student.getAge() %>" required>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3"><%= student.getAddress() %></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <a href="viewStudents" class="btn btn-ghost">Cancel</a>
                    </div>
                </form>
            </div>
            <% } %>
        </main>

        <footer class="footer">
            <p>Built with Java Servlets + MongoDB</p>
        </footer>
    </div>
</body>
</html>
