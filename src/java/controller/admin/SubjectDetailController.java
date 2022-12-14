/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.SubjectDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.RoleList;
import model.Subject;
import model.User;

/**
 *
 * @author duyng
 */
public class SubjectDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (!action.equals("add")) {
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            SubjectDBContext sdbc = new SubjectDBContext();
            Subject subject = sdbc.get(id);
            request.setAttribute("subject", subject);
        }

        if (!action.equals("view")) {
            UserDBContext udbc = new UserDBContext();
            ArrayList<User> managers = udbc.listByRole(12);
            udbc = new UserDBContext();
            ArrayList<User> experts = udbc.listByRole(15);

            request.setAttribute("managers", managers);
            request.setAttribute("experts", experts);
        }

        request.setAttribute("action", action);
        request.getRequestDispatcher("../../view/admin/SubjectDetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("add")) {
            Subject subject = new Subject();

            subject.setCode(request.getParameter("code").trim());
            subject.setName(request.getParameter("name").trim());
            subject.setBody(request.getParameter("body").trim());
            subject.setStatus(true);

            UserDBContext udbc = new UserDBContext();
            int expert_id = Integer.parseInt(request.getParameter("expert"));
            User expert = udbc.get(expert_id);
            subject.setExpert(expert);

            udbc = new UserDBContext();
            int manager_id = Integer.parseInt(request.getParameter("manager"));
            User manager = udbc.get(manager_id);
            subject.setManager(manager);

            SubjectDBContext sdbc = new SubjectDBContext();
            int actionStatus = sdbc.addSubject(subject);

            udbc = new UserDBContext();
            ArrayList<User> managers = udbc.listByRole(12);
            udbc = new UserDBContext();
            ArrayList<User> experts = udbc.listByRole(15);

            request.setAttribute("managers", managers);
            request.setAttribute("experts", experts);
            request.setAttribute("action", "edit");
            request.setAttribute("subject", subject);
            request.setAttribute("actionStatus", actionStatus);
            request.getRequestDispatcher("../../view/admin/SubjectDetail.jsp").forward(request, response);
            return;
        }

        SubjectDBContext sdbc = new SubjectDBContext();
        int id = Integer.parseInt(request.getParameter("id").trim());
        Subject subject = sdbc.get(id);

        int expert_id = Integer.parseInt(request.getParameter("expert").trim());
        UserDBContext udbc = new UserDBContext();
        User expert = udbc.get(expert_id);
        Boolean status = request.getParameter("status").trim().equals("true");
        subject.setId(id);
        subject.setExpert(expert);
        subject.setStatus(status);

        HttpSession session = request.getSession();
        RoleList roles = (RoleList) session.getAttribute("roles");
        if (roles.isAdmin()) {
            subject.setCode(request.getParameter("code").trim());
            subject.setName(request.getParameter("name").trim());
            subject.setBody(request.getParameter("body").trim());
            int manager_id = Integer.parseInt(request.getParameter("manager").trim());
            udbc = new UserDBContext();
            User manager = udbc.get(manager_id);
            subject.setManager(manager);
        }

        sdbc = new SubjectDBContext();
        int actionStatus = sdbc.updateSubject(subject);

        udbc = new UserDBContext();
        ArrayList<User> managers = udbc.listByRole(12);
        udbc = new UserDBContext();
        ArrayList<User> experts = udbc.listByRole(15);

        request.setAttribute("managers", managers);
        request.setAttribute("experts", experts);
        request.setAttribute("action", "edit");
        request.setAttribute("subject", subject);
        request.setAttribute("updateStatus", actionStatus);
        request.getRequestDispatcher("../../view/admin/SubjectDetail.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
