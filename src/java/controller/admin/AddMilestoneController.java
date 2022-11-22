/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AssignmentDBContext;
import dal.ClassDBContext;
import dal.MilestoneDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Assignment;
import model.User;
import model.Class;
import model.Milestone;

/**
 *
 * @author Lenovo
 */
public class AddMilestoneController extends HttpServlet {
   
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
            out.println("<title>Servlet AddMilestoneController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMilestoneController at " + request.getContextPath () + "</h1>");
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
        //processRequest(request, response);
        HttpSession ses = request.getSession();
        User user_sess = (User) ses.getAttribute("user");
        int user_id = user_sess.getId();
        UserDBContext userDBContext = new UserDBContext();
        HashMap<String,Integer> userRoles = userDBContext.getUserRole(user_id);
        
        Boolean isAdmin = false;
        for (Map.Entry<String, Integer> entry : userRoles.entrySet()) {
            Object key = entry.getKey();
            Integer val = entry.getValue();
            if(val == 11){
                isAdmin = true;
                break;
            }
        }
        
        int trainerId = -1;
        if(isAdmin == false) trainerId = user_id;
        ClassDBContext classDBContext = new ClassDBContext();
        AssignmentDBContext assignmentDBContext = new AssignmentDBContext();
        ArrayList<model.Class> classes = classDBContext.listClasses(trainerId);
        
        String classTemp = request.getParameter("class");
        int classId = -1;
        if (classTemp != null) {
            classId = (!classTemp.equals("-1")) ? new Integer(classTemp) : -1;
        }
        if(classId == -1) classId = classes.get(0).getClass_id();
        
        ArrayList<Assignment> assignments = new ArrayList<>();

        Class classToAss = classDBContext.get(classId);
        assignments = assignmentDBContext.listBySubject(classToAss.getSubject_id().getId());
        String assTemp = request.getParameter("ass");
        int assId = -1;
        if (assTemp != null) {
            assId = (!assTemp.equals("-1")) ? new Integer(assTemp) : -1;
        }
        if(assId == -1) assId = assignments.get(0).getAss_id();
        
        Assignment assignment = assignmentDBContext.get(assId);
        
        request.setAttribute("classId", classId);
        request.setAttribute("assId", assId);
        request.setAttribute("assignment", assignment);
        request.setAttribute("classes", classes);
        request.setAttribute("assignments", assignments);
        request.getRequestDispatcher("../../view/admin/NewMilestone.jsp").forward(request, response);
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
        //processRequest(request, response);
        String classTemp = request.getParameter("classId");
        String assTemp = request.getParameter("assId");
        String title = request.getParameter("title");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        
        int statusNumber = 0, classId = 0, assId = 0;
        try {
            statusNumber = Integer.parseInt(status);
            classId = Integer.parseInt(classTemp);
            assId = Integer.parseInt(assTemp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        MilestoneDBContext milestoneDBContext = new MilestoneDBContext();
        Milestone milestone = new Milestone();
        milestone.setBody("");
        milestone.setDescription(description);
        milestone.setStatus(statusNumber);
        milestone.setTitle(title);
        try {
            milestone.setFrom_date(new SimpleDateFormat("yyyy-MM-dd").parse(startDate));
            milestone.setTo_date(new SimpleDateFormat("yyyy-MM-dd").parse(endDate));
        } catch (ParseException ex) {
            Logger.getLogger(MilestoneDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Assignment a = new Assignment();
        a.setAss_id(assId);
        
        Class c = new Class();
        c.setClass_id(classId);
        
        milestone.setAss(a);
        milestone.setClass_milestone(c);
        milestoneDBContext.add(milestone);
        response.sendRedirect("list?&success=true");
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
