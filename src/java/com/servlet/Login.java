/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dbHandlers.LoginHandler;
import com.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mauri
 */
public class Login extends HttpServlet {

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
        response.sendRedirect("index.html");
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
        
        String correo = request.getParameter("correo");
        String pass = request.getParameter("pass");
        
        try {
            LoginHandler lh = new LoginHandler();
            ArrayList<Usuario> result = lh.getUser(correo, pass);
            
            if (result.size() == 0) {
                response.sendRedirect("index.html");
                return;
            } else {
                int c1 = result.get(0).id;
                String c2 = result.get(0).correo;
                String c3 = result.get(0).nombre;
                String c4 = result.get(0).rol;
                
                HttpSession session = request.getSession(true);
                session.setAttribute("userId", c1 + "");
                session.setAttribute("correo", c2);
                session.setAttribute("nombre", c3);
                session.setAttribute("rol", c4);
                response.sendRedirect("home.jsp");
            }
            
        } catch (SQLException e) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            PrintWriter out = response.getWriter();
            out.println(e);
            
        } catch (ClassNotFoundException e) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            PrintWriter out = response.getWriter();
            out.println(e);
        }
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
