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
import sentiment.services.ManageLikeCommentServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class UpdateLikeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try 
        {
            int uid=Integer.parseInt(req.getParameter("uid"));
            int sid=Integer.parseInt(req.getParameter("sid"));
            int like=Integer.parseInt(req.getParameter("like"));
            PrintWriter pw = resp.getWriter();
            int prevlike=ManageLikeCommentServices.getLike(uid, sid);
            System.out.println(prevlike+" "+like);
            if(prevlike!=-2&&like==1)
            {
                if(prevlike==1)
                {
                   
                    ManageLikeCommentServices.updateLike(uid, sid, 0);
                    pw.print(0);
                }
                else 
                {
                    ManageLikeCommentServices.updateLike(uid, sid, 1);
                    pw.print(1);                    
                }
            }
            else if(prevlike!=-2)
            {
                if(prevlike==-1)
                {
                    ManageLikeCommentServices.updateLike(uid, sid, 0);
                    pw.print(0);
                }
                else 
                {
                    ManageLikeCommentServices.updateLike(uid, sid, -1);
                    pw.print(-1);                    
                }
            }
            pw.close();
        } catch (Exception e) {
            System.out.println("Add Comment Servlet " + e);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    
}
