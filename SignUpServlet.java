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
import sentiment.bean.UserBean;
import sentiment.services.ManageUserServices;

/**
 *
 * @author pawittar samra
 */
public class SignUpServlet extends HttpServlet
{
 @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
      resp.setContentType("text/html");
      PrintWriter pw = null;
      UserBean objbean=null;
      try
      {
        pw = resp.getWriter();
        objbean = new UserBean();
              objbean.setName(req.getParameter("txtname"));
        if(req.getParameter("txtusername")!=null)
              objbean.setUsername(req.getParameter("txtusername"));
        if(req.getParameter("txtcontact")!=null)
              objbean.setContact(req.getParameter("txtcontact"));
              objbean.setPassword(req.getParameter("txtpassword"));
              objbean.setEmail(req.getParameter("txtemail"));
              objbean.setDob(req.getParameter("txtdob"));
              if(req.getParameter("rbgender").equalsIgnoreCase("Male"))
              {
                  objbean.setGender(true);
              }
              else
              {
                  objbean.setGender(false);
              }
              objbean.setLogintype(0);
              objbean.setVerify(false);
              objbean.setUserstatus(true);
              objbean.setUsertype("User");
              System.out.println(objbean);
              if(ManageUserServices.addUser(objbean))
              {
                    resp.sendRedirect("Home.jsp");
              }
              else
              {
                  resp.sendRedirect("SignUp.jsp");
              }
         
      }
      catch(Exception e)
      {
          pw.println(e);
      }
      
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //    super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    doPost(req,resp);
    }
}
