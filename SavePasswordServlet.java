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
 * @author Parmpal Singh Gill
 */
public class SavePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s=request.getSession(false);
        if(s!=null)
        {
            int id=(Integer)s.getAttribute("userid");
            String oldpass=request.getParameter("txtoldpassword");
            String newpass=request.getParameter("txtnewpassword");
            if(ManageProfileServices.changePassword(id, oldpass, newpass))
            {
                response.sendRedirect("Logout?msg=Password Changed Successfully");
            }
            else
            {
                response.sendRedirect("ViewProfile.jsp?msg=Password does not match");
            }
        }
        else
        {
            response.sendRedirect("Login.html?msg=Login First");
        }
    }

}
