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
import sentiment.services.LoginServices;
import sentiment.services.ManageProfileServices;

/**
 *
 * @author Parmpal Singh Gill
 */
public class FBGmailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int logintype=Integer.parseInt(req.getParameter("logintype"));
        UserBean objBean = LoginServices.loginWithFbGmail(req.getParameter("FID"),logintype);
        PrintWriter pw = resp.getWriter();
        if (objBean != null) {
            if (objBean.isUserstatus()) {
                HttpSession ss = req.getSession(false);
                ss.setAttribute("userid", objBean.getUserid());
                ss.setAttribute("usertype", objBean.getUsertype());
                ss.setAttribute("logintype", objBean.getLogintype());
                pw.print("true");
            } else {
                pw.println("false");
            }

        } else {
            UserBean objbean = new UserBean();
            objbean.setEmail(req.getParameter("email"));
            objbean.setPassword(req.getParameter("FID"));
            objbean.setName(req.getParameter("name"));
            objbean.setLogintype(Integer.parseInt(req.getParameter("logintype")));
            int id = ManageProfileServices.signUpWithFbGmail(objbean);
            objbean = ManageProfileServices.getbyUserId(id);
            HttpSession ss = req.getSession(false);
            ss.setAttribute("userid", objbean.getUserid());
            ss.setAttribute("usertype", objbean.getUsertype());
            ss.setAttribute("logintype", objBean.getLogintype());
            pw.print("true");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("DOGet");
        doPost(req, resp);
    }

}
