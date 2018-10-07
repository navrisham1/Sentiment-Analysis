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
</head>
<body>
     <%@include file="Header.jsp" %>
       <div id="wrapper">
    	
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
               
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper tp" style="margin-top:50px; margin-bottom:50px;" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
                      <div class="adm-otp">
					  
                          <h2 style="font-weight:300;"> How do you want to recover password ?  </h2>
                        <form action="ForgotPassword" method="post">
                        <label for="txtnumber">Enter number:</label>
                        <input type="number" name="txtnumber">
                                <br><br>
                        <label for="txtemail">Enter Email&nbsp;&nbsp;:&nbsp;&nbsp;</label>
                        <input for="txtemail" name="txtemail">
                            <br><br>
                                <label for="PasswordMethod" style="font-weight:bold">How would you like to get OTP</label>
                        <br>
                        <br>
                        <label for="rbsource">Send OTP Via</label>
                        <input type="radio" name="rbsource" value="mobile" checked>Mobile Number
                        <input type="radio" name="rbsource" value="email">Email
                        <br>
			  <input class="otp-sbmt" type="submit" value="Submit"> 
			  <input class="otp-sbmt" type="Reset" value="Reset"> 
                              <br><br>
                                      <%if(request.getParameter("msg")!=null){%>
                                      <%=request.getParameter("msg") %>
                                      <%}%>
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
	<li><a href="#"> Home </a></li>
	<li><a href="#"> My Account </a></li>
	<li><a href="#"> Analysis </a></li>
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
    
   
</body>
</html>

