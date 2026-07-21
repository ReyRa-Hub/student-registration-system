package com.studentapp.servlet;

import com.studentapp.dao.StudentDAO;
import com.studentapp.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name    = request.getParameter("name");
        String email   = request.getParameter("email");
        String phone   = request.getParameter("phone");
        String course  = request.getParameter("course");
        String address = request.getParameter("address");

        // ── Validate required fields ──
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Name is required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (phone == null || phone.trim().isEmpty()) {
            request.setAttribute("error", "Phone is required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (course == null || course.trim().isEmpty()) {
            request.setAttribute("error", "Course is required");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        int age = 0;
        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Age must be a valid number");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        Student student = new Student(name.trim(), email.trim(), phone.trim(),
                                      course.trim(), age,
                                      address != null ? address.trim() : "");

        try {
            studentDAO.addStudent(student);
            // Redirect (PRG pattern) so the user sees the new student in the list
            response.sendRedirect("viewStudents?success=Student+registered+successfully");
        } catch (Exception e) {
            request.setAttribute("error", "Error registering student: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
