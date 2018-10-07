/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sentiment.services.ManageUserServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ChangeStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ManageUserServices.changeUserStatus(Integer.parseInt(req.getParameter("userid")));
        resp.sendRedirect("ManageUser.jsp");
    }
    
    
}
