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
import sentiment.bean.SearchBean;
import sentiment.bean.UserBean;
import sentiment.db.DBConnection;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ManageUserSearch {

    public static boolean addSearch(SearchBean sb, int uid) {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs;
        ArrayList<String> al = null;
        try {
            al = new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into search(keyword,postive,negtive,likes,dislikes) values(?,?,?,?,?)");
            pstmt.setString(1, sb.getKeyword());
            pstmt.setInt(2, sb.getPosResult());
            pstmt.setInt(3, sb.getNegResult());
            pstmt.setInt(4, 0);
            pstmt.setInt(5, 0);
            if (pstmt.executeUpdate() > 0) {
                pstmt = conn.prepareStatement("select max(searchid) from search where keyword=?");
                pstmt.setString(1, sb.getKeyword());
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    int srid=rs.getInt("max(searchid)");
                    pstmt = conn.prepareStatement("insert into usersearch(userid,searchid,likes) values(?,?,?)");
                    pstmt.setInt(1, uid);
                    pstmt.setInt(2, srid);
                    pstmt.setInt(3, 0);
                    if (pstmt.executeUpdate() > 0) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Add search id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Seaerch " + e);
            }

        }
        return false;

    }    
        public static boolean updateSearch(SearchBean sb, int uid) {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs;
        ArrayList<String> al = null;
        try {
            al = new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("update search set postive=?,negtive=?,likes=?,dislikes=? ");
            pstmt.setString(1, sb.getKeyword());
            pstmt.setInt(2, sb.getPosResult());
            pstmt.setInt(3, sb.getNegResult());
            pstmt.setInt(4, 0);
            pstmt.setInt(5, 0);
            if (pstmt.executeUpdate() > 0) {
                pstmt = conn.prepareStatement("select max(searchid) from search where keyword=?");
                pstmt.setString(1, sb.getKeyword());
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    int srid=rs.getInt("max(searchid)");
                    pstmt = conn.prepareStatement("insert into usersearch(userid,searchid,likes) values(?,?,?)");
                    pstmt.setInt(1, uid);
                    pstmt.setInt(2, srid);
                    pstmt.setInt(3, 0);
                    if (pstmt.executeUpdate() > 0) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Add search id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Seaerch " + e);
            }

        }
        return false;

    }
    public static int getmaxIDofGivennKeyword(String word)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT max(searchid) FROM search where keyword=?");
            pstmt.setString(1,word);
            rs = pstmt.executeQuery();
            if(rs.next()) {
              return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("GetSearchByUserLike id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("GetSearchByUserLike " + e);
            }

        }
        return 0;        
    }
    public static int getmaxID()
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("SELECT max(searchid) FROM search");
            rs = pstmt.executeQuery();
            if(rs.next()) {
              return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("GetSearchByUserLike id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("GetSearchByUserLike " + e);
            }

        }
        return 0;        
    }

    public static ArrayList<String> getSearchesByUserID(int userid) {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> al = null;
        try {
            al = new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select DISTINCT keyword from usersearch inner join search on\n"
                    + "usersearch.searchid=search.searchid where userid=? order by usersearch.likes desc");
            pstmt.setInt(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                al.add(rs.getString("keyword"));
            }
            return al;
        } catch (Exception e) {
            System.out.println("GetSearchByUserLike id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("GetSearchByUserLike " + e);
            }

        }

        return null;
    }
    public static ArrayList<SearchBean> getSearchesByKeyborad(String keyword) {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<SearchBean> al = null;
        try {
            al = new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select searchid,postive,negtive,likes,dislikes from search where keyword=?");
            pstmt.setString(1, keyword);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                SearchBean sb=new SearchBean();
                sb.setDislikes(rs.getInt("dislikes"));
                sb.setLikes(rs.getInt("likes"));
                sb.setKeyword(keyword);
                sb.setNegResult(rs.getInt("negtive"));
                sb.setPosResult(rs.getInt("postive"));
                al.add(sb);
            }
            return al;
        } catch (Exception e) {
            System.out.println("GetSearchByUserLike id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("GetSearchByUserLike " + e);
            }

        }

        return null;
    }

    public static ArrayList<String> getSearchedKeyword() {
        //mysql> select keyword  from search inner join usersearch on search.searchid=usersearch.searchid group by search.searchid order by count(keyword)desc;
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<String> al = null;
        try {
            al = new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select DISTINCT keyword  from search inner join usersearch on search.searchid="
                    + "usersearch.searchid group by search.searchid order by count(keyword) desc");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                al.add(rs.getString("keyword"));
            }
            return al;
        } catch (Exception e) {
            System.out.println("GetSearchByUserLike id " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("GetSearchByUserLike " + e);
            }

        }
        return al;
    }    
}
