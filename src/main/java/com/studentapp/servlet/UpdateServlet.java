package com.studentapp.servlet;

import com.studentapp.dao.StudentDAO;
import com.studentapp.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id      = request.getParameter("id");
        String name    = request.getParameter("name");
        String email   = request.getParameter("email");
        String phone   = request.getParameter("phone");
        String course  = request.getParameter("course");
        String address = request.getParameter("address");

        // ── Validate ID ──
        if (id == null || id.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
            return;
        }

        // ── Validate required fields ──
        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || course == null || course.trim().isEmpty()) {
            response.sendRedirect("edit?id=" + id + "&error=" +
                    URLEncoder.encode("All fields except address are required", StandardCharsets.UTF_8.name()));
            return;
        }

        int age = 0;
        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {
            response.sendRedirect("edit?id=" + id + "&error=" +
                    URLEncoder.encode("Age must be a valid number", StandardCharsets.UTF_8.name()));
            return;
        }

        Student student = new Student(name.trim(), email.trim(), phone.trim(),
                                      course.trim(), age,
                                      address != null ? address.trim() : "");
        student.setId(id);

        try {
            boolean updated = studentDAO.updateStudent(student);
            if (updated) {
                response.sendRedirect("viewStudents?success=" +
                        URLEncoder.encode("Student updated successfully", StandardCharsets.UTF_8.name()));
            } else {
                response.sendRedirect("viewStudents?error=" +
                        URLEncoder.encode("No changes were made (student may not exist)", StandardCharsets.UTF_8.name()));
            }
        } catch (Exception e) {
            response.sendRedirect("viewStudents?error=" +
                    URLEncoder.encode("Error updating student: " + e.getMessage(), StandardCharsets.UTF_8.name()));
        }
    }
}
