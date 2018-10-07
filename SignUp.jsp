<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Emotionalysis</title>
    <meta name="google-signin-client_id" content="870023674116-jfu5pqqchvch20oouevag12decr3ailu.apps.googleusercontent.com">
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

            var carr = ["HRAI", "28ivw", "k4ez", "jw62k", "FH2DE", "gwprp", "4D7YS", "e5hb", "xm9ki", "XDHYN", "6ne3", "q98p"];
            var ran = 0;
            function loadCapcha()
            {
                ran = parseInt((Math.random() * 100) % 12);
                document.getElementById("capch").src = "images/captcha/captcha" + ran + ".jpg";
            }
            function validForm()
            {                         //trim for removing unneccessary spaces
                var un = document.getElementById("txtusername").value.trim();
                window.alert("valididate "+un);
                if (un == "")
                {
                    window.alert("MUST ENTER USERNAME");
                    document.getElementById("txtusername").focus();
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
                var pwd = document.getElementById("txtpassword").value;
                if (pwd == "")
                {
                    window.alert("MUST ENTER PASSWORD");
                    return false;
                }
                var cnpwd = document.getElementById("txtconfirm").value;
                if (cnpwd == "")
                {
                    window.alert("MUST RE-ENTER PASSWORD");
                    return false;
                } 
                else if (pwd != cnpwd)
                {
                    window.alert("CONFIRM PASSWORD MUST MATCH WITH FIRST PASSWORD ENTERED "+pwd+" "+cnpwd);
                    return false;
                }
                var email = document.getElementById("txtemail").value.trim();
                if (email == "")
                {
                    window.alert("MUST ENTER E-MAIL");
                    return false;
                }
                var cal = document.getElementById("cval").value;
                if (cal != carr[ran])
                {
                    window.alert("Not Match");
                    document.getElementById("cval").focus();
                    document.getElementById("capchaAlert").innerHTML="Enter the Correct Capcha";
                    loadCapcha();
                    return false;
                }          
                return true;
            }
            function checkExit()
            {
                var xmlhttp = new XMLHttpRequest();
                var username = document.getElementById("txtusername").value;
                var url = "CheckUserName?username=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        if (xmlhttp.responseText.trim() == "Username Already exist")
                        {
                            document.getElementById("isE").style.color = "red";
                            document.getElementById("txtusername").focus();

                        } else
                        {
                            document.getElementById("isE").style.color = "green";
                        }
                        document.getElementById("isE").innerHTML = xmlhttp.responseText.trim();
                    }
                };

                try
                {
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                } catch (e)
                {
                    alert("Unable to connect Server " + e);
                }
            }
        </script>
    
       </head>
<body onload="loadCapcha()">
            <%@include file="Header.jsp" %>
       <div id="wrapper">
    	<div class="container">

        </div>
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
                 
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                         <h2>Sign UP</h2> 
                         <hr class="horizontal-line" style="margin: 30px 0;"> 

                    <form class="inner-width" action="SignUp" method="post" onsubmit="return validForm()">
                         <div class="signup-form">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Name" id='txtname' name="txtname" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Contact" id='txtcontact' name="txtcontact" />
                                </div>
                            </div>
                        </div>
                                <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Username" id='txtusername' name="txtusername" onblur="return checkExit()" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <span id="isE"></span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="email" class="form-control" id='txtemail' placeholder="Email Id" name="txtemail"/>
                                </div>
                            </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="date" class="form-control" placeholder="DOB" id='txtdob' name="txtdob" />
                                </div>
                            </div>                            
                        </div>

                        <div class="form-group">
                                <div class="form-group">
                                    <input type="password" class="form-control phone" placeholder="Password" id='txtpassword' name="txtpassword" />
                                </div>
                            <div class="form-group">                                
                            <input type="password" class="form-control" placeholder="Re-enter Password" id='txtconfirm' name="txtconfirm"/>
                            </div>
                        <input type="radio" name="rbgender" value="Male" checked>Male
                                <input type="radio" name="rbgender" value="Female">Female
                       
                        </div>
					<%--	<div class="form-group">
						<label> Captcha </label>
                            <input type="txt" class="form-control"  id='captch' />
                        </div>--%>
                                          <img src="" alt="Captcha" id="capch" height="50" width="150">
                                              
                                              <input type="button" value="Change" onclick="loadCapcha()"/>
                        <br>
                        <br>
                            <label for="txtcaptcha">Enter captcha:</label>
                            <br>
                            <input type="text" name="cval" id="cval"/>
                        <br>
                            <br>
                            <span id="capchaAlert"></span>
                        <br>
                       

                        <div class="form-group">
                            <br>                           
                                <button id='btnContactUs' type="submit" class="btn btn-info send-mail text-left transition-for-all"> Sign up</button>
                        </div>
                    </div>
		<hr class="horizontal-line" style="margin: 30px 0;"> 
		<div class="conct">
					<h3> Connect With </h3>
					<ul>
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                    <br>
                    <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" 
                         data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();"></div>
				</ul> 
			</div>                         
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
	
            <li><a href="AboutUs.jsp"> About us </a></li>
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
    <!--<script src="js/jquery-1.10.2.js"></script>-->
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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="js/jquery-3.2.0.js" type="text/javascript"></script>

    <script src="js/FBLOGIN.js" type="text/javascript"></script>
    <script src="js/GmailLogin.js" type="text/javascript"></script>

        <script>
		$("#date-id").datepicker({ minDate: 0, maxDate: 75});
	</script>
    
   
</body>
</html>
