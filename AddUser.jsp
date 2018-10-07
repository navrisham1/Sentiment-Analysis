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
                var pwd = document.getElementById("txtpassword").value.trim();
                if (pwd == "")
                {
                    window.alert("MUST ENTER PASSWORD");
                    return false;
                }
                var cnpwd = document.getElementById("txtconfirm").value.trim();
                if (cnpwd == "")
                {
                    window.alert("MUST RE-ENTER PASSWORD");
                    return false;
                } else if (pwd != cnpwd)
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
                return true;
            }
//            function checkExit()
//            {
//                var xmlhttp = new XMLHttpRequest();
//                var username = document.getElementById("txtusername").value;
//                var url = "CheckUserName.jsp?username=" + username;
//                xmlhttp.onreadystatechange = function () {
//                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
//                    {
//                        if (xmlhttp.responseText.trim() == "Username Already exist")
//                        {
//                            document.getElementById("isE").style.color = "red";
//                            document.getElementById("txtusername").focus();
//
//                        } else
//                        {
//                            document.getElementById("isE").style.color = "green";
//                        }
//                        document.getElementById("isE").innerHTML = xmlhttp.responseText.trim();
//                    }
//                };
//
//                try
//                {
//                    xmlhttp.open("GET", url, true);
//                    xmlhttp.send();
//                } catch (e)
//                {
//                    alert("Unable to connect Server " + e);
//                }
//            }

        </script>
       </head>
<body>
     <% if(session.getAttribute("usertype")!=null&&session.getAttribute("usertype").equals("Administrator"))
            {
        %>
     <%@include file="Header.jsp" %>
           <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
           <%@include file="Navigation.jsp" %>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                    <form action="AddUser" method="post" onsubmit="return validForm()" name="adduser">
    
                      <div class="adm-prf">
					  <h2 style="font-weight:300;"> Add User </h2>
					  <hr class="horizontal-line" style="margin: 30px 0;"> 
			
                                              <form action="AddUser" method="post" onsubmit="return validForm()" name="adduser">                                              
                <div class="contact-form">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="txtname">Name:</label>
                                    <input type="text" class="form-control" placeholder="Name" id='txtname' name="txtname" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="txtcontact">Contact:</label>
                                    <input type="number" class="form-control" placeholder="Contact" id='txtcontact' name="txtcontact"/>
                                </div>
                            </div>
                        </div>
                
                            
                            
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="txtpassword">Password:</label>
                                    <input type="password" class="form-control phone" placeholder="Password" id='txtpassword' name="txtpassword" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="txtconfirm">Confirm Password:</label>
                                    <input type="password" class="form-control" id='txtconfirm' placeholder="Confirm Password" name="txtconfirm"/>
                                </div>
                            </div>
                        </div>
						
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label for="txtemail">Email:</label>
                                    <input type="email" class="form-control" id='txtemail' placeholder="Email Id" name="txtemail" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Usertype:</label>
                                   <select class="usr-typ" name="ddlusertype">
								   
                        <option value="Administrator" selected>Administrator</option>
                            <option value="User">User</option>
				</select>
                                </div>
								
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
			<label> Date of Birth </label>
                        <input type="date" class="form-control" placeholder="DOB" id='txtContact' name="txtdob" />
                   	</div>
                            <div class="form-group"></div>
			</div>
                    <br>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                       </div>

                        <div class="form-group">
						<label> User Status </label>
                          <input type="radio" name="rbuserstatus" value="Active"> Active
						  <input type="radio" name="rbuserstatus" value="Inactive" checked> Inactive
						  </div>
                        <div class="form-group">
			                    <label for="gender">Gender:</label>
                            <input type="radio" name="rbgender" value="Male" checked>Male
                                <input type="radio" name="rbgender" value="Female">Female
 			  </div>
                        <div class="form-group">
                                                      <%--  <label> Captcha </label>
						  <input type="text" name="txtcaptcha" id="captcha">
						  <img src="img/user-img.png">--%>
                        </div>

                        <div class="form-group">
                            <button id='btnContactUs' type="button" class="btn btn-info send-mail text-left transition-for-all"> Add User</button>
                        </div>
                    </div>
					</form>				  
				  
					 
						
                    </div>
                   </form>
                </div>              
                 <!-- /. ROW  -->
                  <hr /> 
                  <%@include  file="Footer.jsp" %>
                          
    		</div>
             <!-- /. PAGE INNER  -->
       </div>
         <!-- /. PAGE WRAPPER  -->
         
       </div>
       	<!-- /. CONTAINER END -->
	</div>
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
    
   <%}else {
        %>
                 <jsp:forward page="Login.jsp"/>
           
        <%}%>
</body>
</html>
