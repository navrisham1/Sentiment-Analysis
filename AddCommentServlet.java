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
import sentiment.bean.CommentBean;
import sentiment.services.ManageLikeCommentServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try 
        {
            CommentBean cb = new CommentBean();
            cb.setUserid(Integer.parseInt(req.getParameter("uid")));
            cb.setSearchid(Integer.parseInt(req.getParameter("sid")));
            cb.setComment(req.getParameter("comment"));
            PrintWriter pw = resp.getWriter();
            if (ManageLikeCommentServices.addComment(cb)) {
                pw.println("true");
            } else {
                pw.println("false");
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
