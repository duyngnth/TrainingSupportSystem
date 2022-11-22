/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendanceDBContext;
import dal.ClassDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Attendance;
import model.Class;
import model.User;

/**
 *
 * @author duyng
 */
public class ScheduleAttendanceController extends HttpServlet {
   
    int pageIndex = 1;
    int pageSize = 5;
    int totalPage;
    int class_id = 0;
    Boolean status = null;
    boolean firsttime = true;
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleAttendanceController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleAttendanceController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
            String pageStr = request.getParameter("page");
            pageIndex = Integer.parseInt(pageStr);
            if (pageIndex <= 0)
                pageIndex = 1;
        } catch (Exception e) {
        }
        
        AttendanceDBContext atdbc = new AttendanceDBContext();
        User user = (User)request.getSession().getAttribute("user");
        ArrayList<Attendance> attendances = atdbc.listByTrainee(user.getId(), class_id, status, pageIndex, pageSize);
        
        ClassDBContext cdbc = new ClassDBContext();
        ArrayList<Class> classes = cdbc.listClassByTrainee(user.getId());
        
        int listCount = atdbc.listByTraineeCount(user.getId(), class_id, status);
        totalPage = (listCount % pageSize == 0) ? listCount / pageSize : listCount / pageSize + 1;
        
        request.setAttribute("attendances", attendances);
        request.setAttribute("classes", classes);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("chosenClassId", class_id);
        request.setAttribute("chosenStatus", status);
        request.getRequestDispatcher("view/ScheduleAttendance.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AttendanceDBContext atdbc = new AttendanceDBContext();
        User user = (User)request.getSession().getAttribute("user");
        
        class_id = Integer.parseInt(request.getParameter("class"));
        String raw_status = request.getParameter("status");
        status = raw_status.equals("null") ? null : raw_status.equals("true") ? true : false;
        
        ArrayList<Attendance> attendances = atdbc.listByTrainee(user.getId(), class_id, status, pageIndex, pageSize);
        
        ClassDBContext cdbc = new ClassDBContext();
        ArrayList<Class> classes = cdbc.listClassByTrainee(user.getId());
        
        int listCount = atdbc.listByTraineeCount(user.getId(), class_id, status);
        totalPage = (listCount % pageSize == 0) ? listCount / pageSize : listCount / pageSize + 1;
        
        request.setAttribute("attendances", attendances);
        request.setAttribute("classes", classes);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("chosenClassId", class_id);
        request.setAttribute("chosenStatus", status);
        request.getRequestDispatcher("view/ScheduleAttendance.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
