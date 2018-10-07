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

/**
 *
 * @author pawittar samra
 */
public class OTPMatchServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try 
        {
            HttpSession s = req.getSession(false);
            int otp = (Integer) s.getAttribute("otp");
            if ((Integer.parseInt(req.getParameter("txtotp"))) == otp) 
            {
                resp.sendRedirect("SetPassword.jsp");
            } else {
                resp.sendRedirect("ForgotPassword.jsp?msg=Otp Does not match");
            }
        } catch (Exception e) {
            System.out.println("OTPMatchServlet" + e);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
        //super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}
