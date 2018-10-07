/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sentiment.services.ManageProfileServices;

/**
 *
 * @author pawittar samra
 */
public class SetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    HttpSession s=req.getSession();
        if(s!=null)
        {
            int id=(Integer)s.getAttribute("userid");
           // String oldpass=req.getParameter("txtoldpassword");
            String newpass=req.getParameter("txtnewpassword");
            if(ManageProfileServices.setPassword(id, newpass))
            {
                resp.sendRedirect("Home.jsp?msg=Password updated");
            }
            else
            {
                resp.sendRedirect("ForgotPassword.jsp?msg=Password not updated");
            }
        }
        else
        {
            resp.sendRedirect("Home.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    doPost(req,resp);
    }

   
}
