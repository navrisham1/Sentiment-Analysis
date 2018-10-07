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
import sentiment.services.LoginServices;

/**
 *
 * @author pawittar samra
 */
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        try {
            if (req.getParameter("txtnumber") != null && req.getParameter("rbsource").equalsIgnoreCase("mobile")) {
                int userid = LoginServices.matchNumber(req.getParameter("txtnumber"));
                HttpSession s = req.getSession();
                s.setAttribute("userid", userid);
                int otp = (int) (Math.random() * 10000);
                s.setAttribute("otp", otp);
                System.out.println(otp);
                if (userid != 0) {
                    if(LoginServices.sendOtp(req.getParameter("txtnumber"),otp))
                    {
                        resp.sendRedirect("OTPConforPassword.jsp");
                    }
                   else
                    {
                      System.out.println("otp not sent");
                      resp.sendRedirect("ForgotPassword.jsp?msg=Can't send otp");
                    }
                } else {
                    resp.sendRedirect("ForgotPassword.jsp?msg=Can't find Given Number in Database ");

                }
            } else if (req.getParameter("txtemail") != null && req.getParameter("rbsource").equalsIgnoreCase("email")) {
                int userid = LoginServices.matchEmail(req.getParameter("txtemail"));
                HttpSession s = req.getSession();
                s.setAttribute("userid", userid);
                int otp = (int) (Math.random() * 10000);
                s.setAttribute("otp", otp);
                System.out.println("Email " + otp);
                if (userid != 0) {
                    if (LoginServices.sendOtpByEmail(req.getParameter("txtemail"), otp)) {
                        resp.sendRedirect("OTPConforPassword.jsp");
                    }
                  else
                    {
                      System.out.println("otp not sent");
                      resp.sendRedirect("Forgotpassword.jsp?msg=otp Not Send");
                    }
                } else {
                    resp.sendRedirect("ForgotPassword.jsp?msg=Can't Send Number Invalid");

                }

            }

        } catch (Exception e) {
            System.out.println("forgotpassword " + e);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //   super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
        doPost(req, resp);
    }

}
