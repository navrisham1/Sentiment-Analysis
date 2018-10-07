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
import javax.servlet.http.HttpSession;
import sentiment.bean.UserBean;
import sentiment.services.ManageUserServices;

/**
 *
 * @author pawittar samra
 */
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      PrintWriter pw = null;
      UserBean objbean=null;
      try
      {
          HttpSession s = req.getSession(false);
          objbean=new UserBean();
          if(s!=null)
          {
              objbean.setUserid(Integer.parseInt(req.getParameter("userid")));
              objbean.setName(req.getParameter("txtname"));
             // objbean.setUsername(req.getParameter("txtusername"));
              objbean.setContact(req.getParameter("txtcontact"));
             // objbean.setPassword(req.getParameter("txtpassword"));
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
              if(req.getParameter("ddlusertype").equalsIgnoreCase("Administrator"))
              {
                  objbean.setUsertype("Administrator");
              }
              else
              {
                  objbean.setUsertype("User");
              }
              if(req.getParameter("rbuserstatus").equalsIgnoreCase("Active"))
              {
                  objbean.setUserstatus(true);
              }
              else
              {
                  objbean.setUserstatus(false);
              }
             // objbean.setLogintype(1);
             // objbean.setVerify(true);
              System.out.println(objbean);
              if(ManageUserServices.UpdateByUserId(objbean))
              {
                   System.out.println("record updated");
                    resp.sendRedirect("ManageUser.jsp");
              }
              else
              {
                  System.out.println("record not updated");
                  resp.sendRedirect("ManageUser.jsp");
              }
          }
          else
          {
              System.out.println("session null");
              resp.sendRedirect("Login");
          }
      }
      catch(Exception e)
      {
          pw.println("EditUser"+e);
      }
      
    
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);//super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

   
}
