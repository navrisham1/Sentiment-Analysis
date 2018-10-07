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
import sentiment.bean.CommentBean;
import sentiment.db.DBConnection;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ManageLikeCommentServices {
    public static boolean updateLike(int uid,int sid,int like)
    {
        System.out.println("U Like");
        Connection conn;
        PreparedStatement pstmt = null;
        ArrayList<String> al=null;
        try {
                al=new ArrayList<>();
                conn=DBConnection.getConnection();
                pstmt=conn.prepareStatement("update usersearch set likes=? where userid=? and searchid=?");
                pstmt.setInt(1, like);
                pstmt.setInt(2, uid);                
                pstmt.setInt(3, sid);
                if(pstmt.executeUpdate()>0)
                {
                    return true;
                }
            }
         catch (Exception e) {
            System.out.println("Add Comment id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Comment " + e);
            }

        }
        return false;
    }
    /*
    *  return like for given userid and search id(-1,0,1), return -2 if not found
    */
    public static int getLike(int uid,int sid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ArrayList<String> al=null;
        ResultSet rs=null;
        try {
                al=new ArrayList<>();
                conn=DBConnection.getConnection();
                pstmt=conn.prepareStatement("select likes from usersearch where userid=? and searchid=?");
                pstmt.setInt(1, uid);                
                pstmt.setInt(2, sid);
                rs=pstmt.executeQuery();
                if(rs.next())
                {
                    return rs.getInt("likes");
                }
            }
         catch (Exception e) {
            System.out.println("Add Comment id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Comment " + e);
            }

        }
        return -2;
    }
    public static boolean  addComment(CommentBean cb) {
                Connection conn;
        PreparedStatement pstmt = null;
        ArrayList<String> al=null;
        try {
                al=new ArrayList<>();
                conn=DBConnection.getConnection();
                pstmt=conn.prepareStatement("insert into comments(searchid,userid,comment) values(?,?,?)");
                pstmt.setInt(1, cb.getSearchid());
                pstmt.setInt(2, cb.getUserid());                
                pstmt.setString(3, cb.getComment());
                if(pstmt.executeUpdate()>0)
                {
                    return true;
                }
            }
         catch (Exception e) {
            System.out.println("Add Comment id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Comment " + e);
            }

        }
        return false;
    }
    public static ArrayList<CommentBean> getSerchComment(int sid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        ArrayList<CommentBean> al=null;
        try {
                al=new ArrayList<>();
                conn=DBConnection.getConnection();
                pstmt=conn.prepareStatement("select commentid,userid,comment from comments where searchid=?");
                pstmt.setInt(1,sid);
                rs=pstmt.executeQuery();
                while(rs.next())
                {
                    CommentBean cb=new CommentBean();
                    cb.setComment(rs.getString("comment"));
                    cb.setCommentid(rs.getInt("commentid"));
                    cb.setSearchid(sid);
                    cb.setUserid(rs.getInt("userid"));
                    al.add(cb);
                }
                return al;
            }
         catch (Exception e) {
            System.out.println("Get Comments id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Get Comments " + e);
            }

        }

        return null;
    }
}
