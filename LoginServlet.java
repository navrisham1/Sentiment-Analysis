/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sentiment.bean.UserBean;
import sentiment.services.LoginServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String em=req.getParameter("txtEmail");
            String pw=req.getParameter("txtpassword");
            UserBean objbean=LoginServices.authenticateUser(em, pw);
            System.out.println(objbean);
            if(objbean!=null)
            {
                if(objbean.isUserstatus())
                {
                    HttpSession ss=req.getSession();
                    ss.setAttribute("userid", objbean.getUserid());
                    ss.setAttribute("usertype", objbean.getUsertype());
                    ss.setAttribute("logintype",objbean.getLogintype());
                    System.out.println(objbean);        
                    RequestDispatcher rd=req.getRequestDispatcher("ViewProfile.jsp");
                    rd.forward(req, resp);
                }
                else
                {
                    resp.sendRedirect("Home.jsp?msg=user is InActive");
                }
            }
            else
            {
               resp.sendRedirect("Home.jsp?msg=UserName or password InValid");
             }
           System.out.println("13");


        } catch (Exception e) {
            System.out.println("LoginServlet " + e);
        } finally {
            try {

            } catch (Exception e) {
                System.out.println("LoginServlet Finally " + e);
            }

        }
    }

}
