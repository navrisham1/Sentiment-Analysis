/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sentiment.bean.UserBean;
import sentiment.services.ManageProfileServices;
import sentiment.services.ManageUserServices;

/**
 *
 * @author pawittar samra
 */
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      PrintWriter pw = null;
      UserBean objbean=null;
      try
      {
          pw = resp.getWriter();
          HttpSession s = req.getSession(false);
          objbean=new UserBean();
          if(s!=null)
          {              
              objbean.setUserid(Integer.parseInt(req.getParameter("userid")));
              objbean.setName(req.getParameter("txtname"));
              objbean.setUsername(req.getParameter("txtusername"));
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
//              System.out.println("req.getParameter(\"fileupload\") "+req.getParameter("fileupload"));
//              File f=new File(req.getParameter("fileupload"));
//              System.out.println("Path is: "+f.getPath());
//              if(ManageUserServices.addImage(f, objbean.getUserid()))
//              {
//                   System.out.println("Image Added");
//                  
//              }
              
              if(ManageProfileServices.UpdateByUserId(objbean))
              {
                   System.out.println("record updated");
                   resp.sendRedirect("ViewProfile.jsp");
              }
              else
              {
                  System.out.println("record not updated");
                  resp.sendRedirect("ViewProfile.jsp");
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
          pw.println(e);
      }
      
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req,resp);
    }

   
}
