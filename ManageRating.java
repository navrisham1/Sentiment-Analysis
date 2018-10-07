/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sentiment.bean.RatingBean;
import sentiment.db.DBConnection;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ManageRating {
    /*public static boolean addRating(RatingBean objbBean)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into rating(users,date,likes,dislikes) values(?,?,?,?)");
            pstmt.setInt(1, objbBean.getUsercount());
            pstmt.setString(2, objbBean.getDate());
            pstmt.setInt(3, objbBean.getLikes());
            pstmt.setInt(4, objbBean.getDislikes());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ManageRating: Add Rating " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeRating: Add Rating Finally" + e);
            }

        }
        return false;*/
     public static boolean addRating(RatingBean objbBean)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into rating (userid,stars) values(?,?)");
           // pstmt.setInt(1, objbBean.getUsercount());
          //  pstmt.setString(2, objbBean.getDate());
            
          //  if(int a=objbBean.getUserid()>1)
           // {
                pstmt.setInt(1, objbBean.getUserid());
           
           // }
            pstmt.setInt(2, objbBean.getStars());
            //pstmt.setInt(4, objbBean.getDislikes());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ManageRating: Add Rating " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeRating: Add Rating Finally" + e);
            }

        }
        return false;
    }
    public static ArrayList<RatingBean> getAllRatings()
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        ArrayList<RatingBean> al=null;
        try {
            al=new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select userid,stars from rating");
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                RatingBean objbean=new RatingBean();
               // objbean.setUsercount(rs.getInt("userid"));
                 objbean.setUserid(rs.getInt("userid"));
               objbean.setStars(rs.getInt("stars"));
              
                //objbean.setDate(rs.getDate("date"));
                al.add(objbean);
            }
            return  al;
        } catch (Exception e) {
            System.out.println("get All Rating " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Get All Rating Finally" + e);
            }
        }
        return null;
    }

}
