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
import sentiment.bean.RatingBean;
import sentiment.services.ManageRating;

/**
 *
 * @author Sony
 */
public class RatingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    
      resp.setContentType("text/html");
      PrintWriter pw = null;
     RatingBean objbean=null;
      try
      {
          pw = resp.getWriter();
          HttpSession s = req.getSession(false);
          objbean=new RatingBean();
          if(s!=null)
          {
            
             // objbean.setDate(req.getParameter("txtdate"));
              int v=Integer.parseInt(req.getParameter("txtstars"));
              if(v>0&&v<6)
              {
             
            objbean.setUserid(Integer.parseInt(req.getParameter("txtuserid")));

            //  s.getAttribute(Integer.parseInt(req.getParameter("userid")));
             // objbean.setUserid(req.getParameter("txtuserid"));
              objbean.setStars(Integer.parseInt(req.getParameter("txtstars")));
              }
         if(v>0&&v<6&&ManageRating.addRating(objbean))
         {
              System.out.println("record added");
              resp.sendRedirect("ViewProfile.jsp");
              //cannt send to result cz admin can only check results
              //for admin new session will built again bt db has all data 
         }
              
          else
              {
                  System.out.println("record not added");
                  resp.sendRedirect("Rating.jsp");
              }
          }
          else
          {
              System.out.println("session null");
              resp.sendRedirect("Login");
          }
    
    
    } catch(Exception e)
      {
          pw.println(e);
      }
      finally {
            try {

            } catch (Exception e) {
                System.out.println("RatingServlet Finally " + e);
            }

        }
    

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}

   

