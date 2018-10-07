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
import sentiment.Analysis.SentimentsAnalysis;
import sentiment.bean.SearchBean;
import sentiment.services.ManageUserSearch;

/**
 *
 * @author Parmpal Singh Gill
 */
public class AnalysisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String word1 = req.getParameter("txtsearch");
        System.out.println("message " + word1);
        int pos = 0, neg = 0;
        int uid = 0;
        HttpSession ss = req.getSession(false);
        if (ss != null && ss.getAttribute("userid") != null) {
            uid = (Integer) ss.getAttribute("userid");
        }
        String word[] = word1.split(" ");
//        for (int j = 0; j < word.length; j++) 
        {
            int pos1 = 0, neg1 = 0;
            try {
//                fbtwitterdata.TwitterData.fetchTweet(word[j]);
//                fbtwitterdata.FB.getPosts(word[j]);
            } catch (Exception ex) {
                System.out.println("Error in data Fetch From Twitter" + ex);
            }
            System.out.println("done");
            int vector[] = SentimentsAnalysis.getPridiction();
            for (int i = 0; i < vector.length; i++) {
               if (vector[i] == 1) {
                    pos1++;
                } else if (vector[i] == 0) {
                    neg1++;
                } else {
                    System.out.println("Error");
                }
            }
            pos += pos1;
            neg += neg1;
        }
        SearchBean sb = new SearchBean();
        sb.setKeyword(word1);
        sb.setPosResult(pos);
        sb.setNegResult(neg);
        ManageUserSearch.addSearch(sb, uid);

        RequestDispatcher rd = req.getRequestDispatcher("Result.jsp?pos=" + pos + "&neg=" + neg + "&word=" + word1);
        rd.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
