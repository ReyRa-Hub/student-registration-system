package com.studentapp.servlet;

import com.studentapp.dao.StudentDAO;
import com.studentapp.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {

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
            Student student = studentDAO.getStudentById(id);
            request.setAttribute("student", student);  // null is handled by the JSP
            request.getRequestDispatcher("editStudent.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("viewStudents?error=Error+loading+student:+" + e.getMessage());
        }
    }
}
