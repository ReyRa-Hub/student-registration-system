package com.studentapp.servlet;

import com.studentapp.dao.StudentDAO;
import com.studentapp.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/viewStudents")
public class ViewStudentsServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students;
        try {
            students = studentDAO.getAllStudents();
        } catch (Exception e) {
            students = new ArrayList<>();
            request.setAttribute("error", "Could not load students: " + e.getMessage());
        }

        request.setAttribute("students", students);
        request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
    }
}
