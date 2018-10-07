/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import com.sun.mail.smtp.SMTPAddressFailedException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sentiment.email.SendSMTP;

/**
 *
 * @author Parmpal Singh Gill
 */
public class SupportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("First");
        String str=req.getParameter("msg");
        resp.getWriter().println(SendSMTP.sendMail("parmpalgill40@gmail.com",str,"Email from Emionalysis"));        
        System.out.println("Last");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
