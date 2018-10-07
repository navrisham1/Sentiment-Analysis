/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sentiment.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sentiment.bean.UserBean;
import sentiment.db.DBConnection;
import sentiment.email.SendSMTP;

/**
 *
 * @author Parmpal Singh Gill
 */
public class LoginServices {
    public static UserBean authenticateUser(String em, String pw) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn=DBConnection.getConnection();
            pstmt=conn.prepareStatement("select username,userid,password,userstatus,usertype,logintype from usermaster where email=?");
            pstmt.setString(1, em);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                if(rs.getInt("logintype")==0&&pw.equals(rs.getString("password")))
                {
                    UserBean objbean=new UserBean();
                    objbean.setUserid(rs.getInt("userid"));
                    objbean.setUsername(rs.getString("username"));
                    objbean.setUserstatus(rs.getBoolean("userstatus"));
                    objbean.setUsertype(rs.getString("usertype"));
                    objbean.setLogintype(rs.getInt("logintype"));
                    return objbean;
                }
            }
        } catch (Exception e) {
            System.out.println("Authenticate User 1" + e);
        } finally {
            try {

            } catch (Exception e) {
                System.out.println("Authenticate User Finally " + e);
            }
        }
        return null;
    }
 
    public static ArrayList<String> getUserByEmail(String em){
        Connection conn;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        ArrayList<String> al=null;
        try {
            al=new ArrayList<>();
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement("select username from usermaster where email=? and logintype=0");
            pstmt.setString(1, em);
            rs=pstmt.executeQuery();
            while(rs.next())
            {
                al.add(rs.getString("username"));
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

    public static boolean sendOtpByEmail(String un)    {
        String[] empass=null;
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try{
            conn=DBConnection.getConnection() ;
            pstmt=conn.prepareStatement("Select email,password from usermaster where username=?");
            pstmt.setString(1, un);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                empass=new String[2];    
                empass[0]=rs.getString("email");
                empass[1]=rs.getString("password");
                return (SendSMTP.sendMail(empass[0],"Your Username is "+un+"\nYour password is "+empass[1],"Password Recovery").equals("sent"));
            }
        }catch(Exception e)
        {
            System.out.println("Send Otp by Email User "+e);
        }
        finally
        {
            try{
                rs.close();
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
                System.out.println("SenD Otp By EMail"+e); //sout
            }
        }
        return false;
    }
    public static UserBean loginWithFbGmail(String fid,int logintype)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn=DBConnection.getConnection();
            pstmt=conn.prepareStatement("select userid,username,userstatus,usertype,logintype from usermaster where password=? and logintype=?");
            pstmt.setString(1, fid);
            pstmt.setInt(2, logintype);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
                    UserBean objbean=new UserBean();
                    objbean.setUserid(rs.getInt("userid"));
                    objbean.setUsername(rs.getString("username"));
                    objbean.setUserstatus(rs.getBoolean("userstatus"));
                    objbean.setUsertype(rs.getString("usertype"));
                    objbean.setLogintype(logintype);
                    return objbean;
            }
        } catch (Exception e) {
            System.out.println("Login With FB User " + e);
        } finally {
            try {

            } catch (Exception e) {
                System.out.println("Login With FB  Finally " + e);
            }
        }
        return null;
    }
     
    
    public static boolean sendOtp(String number,int otp)
    {
               String msg=("Your%20one%20time%20password%20is"+otp);
               System.out.println(""+number+""+msg);
               try
               {
                   URL myurl=new URL("http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=amrit.samra77@gmail.com:1234567&senderID=TEST%20SMS&receipientno="+number+"&msgtxt="+msg+"");
                   BufferedReader in=new BufferedReader(new InputStreamReader(myurl.openStream()));
                   String inputLine;
                   while((inputLine=in.readLine())!=null)
                       System.out.println(inputLine);
                   in.close();
                   return true;
               }
               catch(Exception e)
               {
                   System.out.println("inside send otp code"+e);
               }
        return false;
    }
    public static boolean sendOtpByEmail(String email,int otp)   
    {
        try{
            return (SendSMTP.sendMail(email,"Your OTP is "+otp,"OTP verification").equals("sent"));           
        }
        catch(Exception e)
        {
            System.out.println("Send Otp by Email"+e);
        }
        return false;
    }
    public static int matchNumber(String num)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn=DBConnection.getConnection();
            pstmt=conn.prepareStatement("select userid from usermaster where contact=? and logintype=0");
            pstmt.setString(1,num);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
               return (rs.getInt("userid"));
            }
        } catch (Exception e) {
            System.out.println("match number " + e);
        } finally {
            try {

            } catch (Exception e) {
                System.out.println("match number Finally " + e);
            }
        }
        return 0;

    }
     public static int matchEmail(String email)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn=DBConnection.getConnection();
            pstmt=conn.prepareStatement("select userid from usermaster where email=? and logintype=0");
            pstmt.setString(1,email);
            rs=pstmt.executeQuery();
            if(rs.next())
            {
               return (rs.getInt("userid"));
            }
        } catch (Exception e) {
            System.out.println("match number " + e);
        } finally {
            try {

            } catch (Exception e) {
                System.out.println("match number Finally " + e);
            }
        }
        return 0;

    }

}
