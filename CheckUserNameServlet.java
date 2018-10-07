/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sentiment.services.ManageUserServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class CheckUserNameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=null;
        try {
            out=resp.getWriter();
            if (ManageUserServices.isUserNamePresent(req.getParameter("username"))) {
                out.println("Username Already exist");
            } else {
                out.println("Username is Valid");
            }
        } catch (Exception e) {
            System.out.println("Check Username" + e);
        }
        finally
        {
            try
            {
                out.close();
            }
            catch(Exception e)
            {
            System.out.println("Check Username Finnalyy" + e);                
            }
        }
    }

}
