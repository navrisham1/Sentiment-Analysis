/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.services;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.imageio.ImageIO;
import sentiment.bean.UserBean;
import sentiment.db.DBConnection;

/**
 *
 * @author Parmpal Singh Gill
 */
public class ManageUserServices {
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
            pstmt.setString(7, objbean.getDob().equals("null")?null:objbean.getDob());
            pstmt.setBoolean(8, objbean.isVerify());
            pstmt.setString(9, objbean.getUsertype());
            pstmt.setInt(10, objbean.getLogintype());  // 1. for passwprd 2. for facebook id in password 3. for gmailid in password
            pstmt.setBoolean(11, objbean.isUserstatus());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Add User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add User Finally" + e);
            }

        }
        return false;
    }    
    public static boolean UpdateByUserId(UserBean objbean)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("update usermaster set name=?,email=?,contact=?,gender=?,dob=?,usertype=?,userstatus=? where userid=?");
            pstmt.setString(1, objbean.getName());
            pstmt.setString(2, objbean.getEmail());
            pstmt.setString(3, objbean.getContact());
            pstmt.setBoolean(4, objbean.isGender());
            pstmt.setString(5, objbean.getDob());
            pstmt.setString(6, objbean.getUsertype());
            pstmt.setBoolean(7, objbean.isUserstatus());
            pstmt.setInt(8, objbean.getUserid());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Update User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Update User Finally" + e);
            }

        }
        return false;
    }    
    public static ArrayList<UserBean> getAllUsers()
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        ArrayList<UserBean> al=null;
        try {
            al=new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select userid,username,name,email,contact,gender,dob,verify,usertype,logintype,userstatus from usermaster");
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                UserBean objbean=new UserBean();
                objbean.setUserid(rs.getInt("userid"));
                objbean.setUsername(rs.getString("username"));
                objbean.setName(rs.getString("name"));
                objbean.setEmail(rs.getString("email"));
                objbean.setContact(rs.getString("contact"));
                objbean.setGender(rs.getBoolean("gender"));
                objbean.setDob(rs.getString("dob"));
                objbean.setVerify(rs.getBoolean("verify"));
                objbean.setUsertype(rs.getString("usertype"));
                objbean.setLogintype(rs.getInt("logintype"));
                objbean.setUserstatus(rs.getBoolean("userstatus"));
                al.add(objbean);
            }
            return  al;
        } catch (Exception e) {
            System.out.println("get All User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Get All User Finally" + e);
            }
        }
        return null;
    }
    public static UserBean getbyUserId(int userid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select username,name,email,contact,gender,dob,verify,usertype,logintype,userstatus from usermaster where userid=?");
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
                objbean.setVerify(rs.getBoolean("verify"));
                objbean.setUsertype(rs.getString("usertype"));
                objbean.setLogintype(rs.getInt("logintype"));
                objbean.setUserstatus(rs.getBoolean("userstatus"));
                return objbean;
            }
        } catch (Exception e) {
            System.out.println("get All User " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Get All User Finally" + e);
            }

        }
        return null;
    }
            
    public static boolean addImage(File f, int id) {
        Connection conn;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("insert into imagemaster(userid,image) values(?,?)");
            pstmt.setInt(1, id);
            if(f==null)
            {
                pstmt.setString(2, null);
            }
            else
            {
                FileInputStream fin = new FileInputStream(f);
                pstmt.setBinaryStream(2, fin, fin.available());
            }
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("Add Image " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Add Image Finally" + e);
            }

        }
        return false;
    }
    public static void copyImage(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select image from imagemaster where userid=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next());
            {
                Blob b=rs.getBlob(1);//2 means 2nd column data  
                byte barr[] = b.getBytes(1, (int) b.length());//1 means first image
                FileOutputStream fout=new FileOutputStream("E:\\developtech\\program\\NetBean\\Sentiments\\web\\images/i"+id+".jpg");  
                fout.write(barr);                
                fout.close();  
          }
        } catch (Exception e) {
            System.out.println("Copy Image " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Copy Image Finally" + e);
            }
        }
    }
    public static BufferedImage getImage(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select image from imagemaster where userid=?");
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            if (rs.next());
            {
                return ImageIO.read(rs.getBinaryStream(1));
/*                Blob b=rs.getBlob(1);//2 means 2nd column data  
                byte barr[] = b.getBytes(1, (int) b.length());//1 means first image
                return barr;
 */           }
        } catch (Exception e) {
            System.out.println("Get Image " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Gett Image Finally" + e);
            }
        }
        return null;
    }
    public static boolean changeUserStatus(int userid)
    {
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select userstatus from usermaster where userid=?");
            pstmt.setInt(1, userid);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                boolean status=rs.getBoolean("userstatus");
                status=status?false:true;
                pstmt=conn.prepareStatement("update usermaster set userstatus=? where userid=?");
                pstmt.setBoolean(1, status);
                pstmt.setInt(2, userid);
                return pstmt.executeUpdate()>0;
            }
        } catch (Exception e) {
            System.out.println("Upddate user Status " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Update User Status Finally" + e);
            }

        }
        return false;
    }
    public static boolean isUserNamePresent(String un)
    {
        
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select username from usermaster where username=?");
            pstmt.setString(1, un);
            return pstmt.executeQuery().next();
        } catch (Exception e) {
            System.out.println("Is User Name Present " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Is Username Present Finally" + e);
            }

        }
        return false;
    }
    
    
    public static String getNameBbyID(int uid)
    {        
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select name from usermaster where userid=?");
            pstmt.setInt(1, uid);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                return rs.getString("name");
            }
        } catch (Exception e) {
            System.out.println("get  Name " + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                System.out.println("Get User Name Finally" + e);
            }

        }
        return null;
    }
   
}
