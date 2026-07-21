package com.studentapp.servlet;

import com.studentapp.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
            return;
        }

        try {
            boolean deleted = studentDAO.deleteStudent(id);
            if (deleted) {
                response.sendRedirect("viewStudents?success=" +
                        URLEncoder.encode("Student deleted successfully", StandardCharsets.UTF_8.name()));
            } else {
                response.sendRedirect("viewStudents?error=" +
                        URLEncoder.encode("Student not found or already deleted", StandardCharsets.UTF_8.name()));
            }
        } catch (Exception e) {
            response.sendRedirect("viewStudents?error=" +
                    URLEncoder.encode("Error deleting student: " + e.getMessage(), StandardCharsets.UTF_8.name()));
        }
    }
}
