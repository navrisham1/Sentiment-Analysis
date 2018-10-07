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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Parmpal Singh Gill
 */
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter pw = null;
        try {
            pw = resp.getWriter();
            HttpSession s=req.getSession();
            s.invalidate();
            pw.println("<html>"
                    + "<body>"
                    + "<h1> Logout Successfuly "
                    + "</body>"
                    + "</html>");
            resp.sendRedirect("Home.jsp");
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    
}
