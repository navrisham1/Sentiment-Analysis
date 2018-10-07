/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sentiment.bean.UserBean;
import sentiment.db.DBConnection;

/**
 *
 * @author Parmpal Singh Gill
 */
//Profile is managed by user
public class ManageProfileServices 
{
        public static boolean addUser(UserBean objbean)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into usermaster(username,name,email,password,contact,gender,dob,verify,usertype,logintype,userstatus) values(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, objbean.getUsername());
            pstmt.setString(2, objbean.getName());
            pstmt.setString(3, objbean.getEmail());
            pstmt.setString(4, objbean.getPassword());
            pstmt.setString(5, objbean.getContact());
            pstmt.setBoolean(6, objbean.isGender());
            pstmt.setString(7, objbean.getDob());
            pstmt.setBoolean(8, false);
            pstmt.setString(9, "user");
            pstmt.setInt(10, objbean.getLogintype());  // 1. for passwprd 2. for facebook id in password 3. for gmailid in password
            pstmt.setBoolean(11, true);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ManaGeProfile: Add User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeProfile: Add User Finally" + e);
            }

        }
        return false;
    }  
    /*
    *   Sign up and return new user id    
    */    
    public static int signUpWithFbGmail(UserBean objbean)
    {
        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into usermaster(name,email,password,gender,verify,usertype,logintype,userstatus) values(?,?,?,?,?,?,?,?)");
            pstmt.setString(1, objbean.getName());
            pstmt.setString(2, objbean.getEmail());
            pstmt.setString(3, objbean.getPassword());
            pstmt.setBoolean(4, true);
            pstmt.setBoolean(5, true);
            pstmt.setString(6, "user");
            pstmt.setInt(7, objbean.getLogintype());  // 1. for passwprd 2. for facebook id in password 3. for gmailid in password
            pstmt.setBoolean(8, true);
            if(pstmt.executeUpdate() > 0)
            {
                pstmt=conn.prepareStatement("select userid from usermaster where email=?");
                pstmt.setString(1, objbean.getEmail());
                rs=pstmt.executeQuery();
                if(rs.next())
                {
                    return rs.getInt("userid");
                }
            }
        } catch (Exception e) {
            System.out.println("Signup Wit FG: Add User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Signupwit FG: Add User Finally" + e);
            }

        }
        return 0;
    }    

    public static boolean UpdateByUserId(UserBean objbean)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("update usermaster set name=?,email=?,contact=?,gender=?,dob=? where userid=?");
            pstmt.setString(1, objbean.getName());
            pstmt.setString(2, objbean.getEmail());
            pstmt.setString(3, objbean.getContact());
            pstmt.setBoolean(4, objbean.isGender());
            pstmt.setString(5, objbean.getDob());
            pstmt.setInt(6, objbean.getUserid());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ManaGeProfile: Update User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeProfile: Update User Finally" + e);
            }
        }
        return false;
    }    
    public static UserBean getbyUserId(int userid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select username,name,email,contact,gender,dob from usermaster where userid=?");
            pstmt.setInt(1, userid);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                UserBean objbean=new UserBean();
                objbean.setUserid(userid);
                objbean.setUsername(rs.getString("username"));
                objbean.setName(rs.getString("name"));
                objbean.setEmail(rs.getString("email"));
                objbean.setContact(rs.getString("contact"));
                objbean.setGender(rs.getBoolean("gender"));
                objbean.setDob(rs.getString("dob"));
                objbean.setSearches(ManageUserSearch.getSearchesByUserID(userid));
                return objbean;
            }
        } catch (Exception e) {
            System.out.println("ManaGeProfile: get User by id" + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeProfile: Get User by id" + e);
            }

        }
        return null;
    }
    
    public static String getNamebyUserId(int userid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select name from usermaster where userid=?");
            pstmt.setInt(1, userid);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                return (rs.getString("name"));
            }
        } catch (Exception e) {
            System.out.println("ManaGeProfile: get Name User by id" + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeProfile: Get name User by id" + e);
            }

        }
        return null;
    }
    public static boolean changePassword(int id,String oldP,String NewP)
    {        
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select password from usermaster where userid=?");
            pstmt.setInt(1, id);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                if(rs.getString("password").equals(oldP))
                {
                    pstmt = conn.prepareStatement("update usermaster set password=? where userid=?");
                    pstmt.setString(1, NewP);
                    pstmt.setInt(2, id);
                    if(pstmt.executeUpdate()>0)
                        return true;
                    else
                        return false;
                }
            }
        } catch (Exception e) {
            System.out.println("ManaGeProfile: Change Password by id" + e);
        } finally {
            try {
                pstmt.close();
            } 
            catch (Exception e) 
            {
                System.out.println("ManaGeProfile: Change password" + e);
            }
        }
        return false;
    }
    public static boolean verifyAccount(int userid)
    {    
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("update usermaster set verify=1 where userid=?");
            pstmt.setInt(1, userid);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("ManaGeProfile: VerifyAccount" + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("ManaGeProfile: verifyAccount Finally" + e);
            }
        }

        return false;
    }
        public static boolean setPassword(int id,String newp)
    {
         Connection conn;
        PreparedStatement pstmt = null;
        try
        {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("update usermaster set password=? where userid=?");
            pstmt.setString(1, newp);
            pstmt.setInt(2, id);
          if(pstmt.executeUpdate()>0)
                        return true;
                    else
                        return false;
        } 
        catch (Exception e)
        {
            System.out.println("setPassword" + e);
        } finally 
        {
            try
            {
                pstmt.close();
            } 
            catch (Exception e) 
            {
                System.out.println("SetPassword" + e);
            }
    
        }
        return false;
    }

}
