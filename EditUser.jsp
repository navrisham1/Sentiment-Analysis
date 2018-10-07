<%@page import="sentiment.bean.UserBean"%>
<%@page import="sentiment.services.ManageUserServices"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Emotionalysis</title>
    
    <link rel="icon" href="img/fav-icon.png">
	<!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet">
     <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        
    <link href="css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

       
      <script>
            function validForm()
            {                         //trim for removing unneccessary spaces
                var un = document.getElementById("txtusername").value.trim();
                if (un == "")
                {
                    window.alert("MUST ENTER USERNAME");
                    document.getElementById("txtusername").focus();
                    return false;
                }
                var pwd = document.getElementById("txtpassword").value.trim();
                if (pwd == "")
                {
                    window.alert("MUST ENTER PASSWORD");
                    return false;
                }
                var name = document.getElementById("txtname").value.trim();
                if (name == "")
                {
                    window.alert("MUST ENTER NAME");
                    return false;
                }
                var contact = document.getElementById("txtcontact").value.trim();
                if (contact == "")
                {
                    window.alert("MUST ENTER CONTACT");
                    return false;
                }
                var cnpwd = document.getElementById("txtconfirm").value.trim();
                if (cnpwd == "")
                {
                    window.alert("MUST RE-ENTER PASSWORD");
                    return false;
                } else if ("txtpassword" != "txtconfirm")
                {
                    window.alert("CONFIRM PASSWORD MUST MATCH WITH FIRST PASSWORD ENTERED");
                    return false;
                }
                var email = document.getElementById("txtemail").value.trim();
                if (email == "")
                {
                    window.alert("MUST ENTER E-MAIL");
                    return false;
                }
                var captcha = document.getElementById("txtcaptcha").value.trim();
                if (captcha == "")
                {
                    window.alert("MUST ENTER CAPTCHA");
                    return false;
                }
                var path = document.getElementById("").value.trim();

            }
        </script>
      
       </head>
<body>
     <% if (session.getAttribute("usertype") != null && session.getAttribute("usertype").equals("Administrator")) {
        %>
     <%@include file="Header.jsp" %>
         <div id="wrapper">
    	<div class="container">
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
           <%@include file="Navigation.jsp" %>
        <!-- /. NAV SIDE  -->
         <%
                int userid = Integer.parseInt(request.getParameter("userid"));
                ManageUserServices.copyImage(userid);
                String imgurl = "images/i" + userid + ".jpg";
                UserBean objbean = ManageUserServices.getbyUserId(userid);
                 if(objbean!=null)
                {
                    System.out.println("ahjbjha");
                }
            %>    
              <form action="EditUser" method="post" onsubmit="return validForm()">
                <input type="hidden" name="userid" value="<%=userid%>"/>
<!--                <div class="simg">
                    <img src="<%=imgurl%>" id ="imgprev" alt="Image not found" height=100 width=80 />
                    <br>
                    Select image: <input type="file" name="fileupload" id="fileupload">
                <input type="file" name="filefield" multiple="multiple">
                </div>-->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
                            		 <div class="dtls">
                                	 <h1 style="color:#02C8FF;"> Edit User </h1>
                                             <h4> Username: <span id="usr-unm" style="color:#000;"> 
                                          <%=objbean.getUsername()%>  
                                       </h4>
                            
                            <tr>
                                <td>   <h4> Name: <span id="usr-nm" style="color:#000;"> <input type="text" id="txtname" name="txtname" value=<%=objbean.getName()%> </span> </h4>
				 <h4>Gender:
                                                  <% if (objbean.isGender()) {%>
                                <input type="radio" name="rbgender" value="Male" checked>Male
                                    <input type="radio" name="rbgender" value="Female">Female
                                    <%} else {%>
                               <input type="radio" name="rbgender" value="Male" >Male
                                    <input type="radio" name="rbgender" value="Female" checked>Female
                                <%}%>
                                </h4>
                                <h4>UserStatus:
                                <% if (objbean.isUserstatus()) {%>    
                                <input type="radio" name="rbuserstatus"  value="Inactive" checked>Inactive
                                    <input type="radio" name="rbuserstatus" value="Active">Active
                                    <%} else {%>
                                <td><input type="radio" name="rbuserstatus"  value="Inactive" >Inactive
                                    <input type="radio" name="rbuserstatus" value="Active" checked>Active</td>
                                    <%}%>
                                </h4>    
				<h4> Dob: <span id="usr-db" style="color:#000;"><input type="date" name="txtdob" value=<%=objbean.getDob()%>> </span> </h4>
				<h4> Contact: <span id="usr-cont" style="color:#000;"><input type="number" id="txtcontact" name="txtcontact" value=<%=objbean.getContact()%>> </span> </h4>
				<label>Usertype</label>
                                 <select name="ddlusertype">
                                        <% if (objbean.getUsertype().equalsIgnoreCase("Administrator")) {%>
                                        <option value="Administrator" selected>Administrator</option>
                                        <option value="User">User</option>
                                        <%} else {%>
                                        <option value="Administrator">Administrator</option>
                                        <option value="User" selected>User</option>
                                        <%}%>
                                    </select>
                                                 <h4> Email: <span id="usr-mail" style="color:#000;"> <input type="email" id="txtemail" name="txtemail" value=<%=objbean.getEmail()%>> </span> </h4>
                                                 <input type="submit" value="SUBMIT">
                                                 <a href="#"> Edit Profile </a>
              </form>
                                     
                                       
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr /> 
                  
    		</div>
             <!-- /. PAGE INNER  -->
       </div>
         <!-- /. PAGE WRAPPER  -->
         
       </div>
       	<!-- /. CONTAINER END -->
	</div>
	
	
	
	<footer>
	<section class="footer">
	<div class="container">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="fttr-lnks">
	<ul>
	
	<li><a href="#"> About us </a></li>
	<li><a  data-toggle="modal" data-target="#myModal" href="#"> Terms & Conditions </a></li>
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Terms & Conditions</h4>
      </div>
      <div class="modal-body">
        <p>1. Emotionalysis reserves the right to suspend  your access and use of this website at any without notice.</p>
		<p> 2.In no-event shall Emotionalysis or its employees be liable for any damages of any nature.  </p>
		<p> 3.These terms shall be governed  by and construed  in accordance with english law.   </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	</ul>
	<p style="font-size:16px; padding:0; color:#fff;">© Copyright 2017 Emotionalysis<br>All rights reserved</p>  
	</div>
	</div>
	</div>
	</div>
	</section>
	</footer>
    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="js/morris/raphael-2.1.0.min.js"></script>
    <script src="js/morris/morris.js"></script>
    
      <!-- CUSTOM SCRIPTS -->
      <script src="js/jquery-ui.js"></script>
	<script src="js/custom.js"></script>
    <script>
		$("#date-id").datepicker({ minDate: 0, maxDate: 75});
	</script>
    
       <%} else {
        %>
        <jsp:forward page="Login.jsp"/>

        <%}%>
    
</body>
</html>
