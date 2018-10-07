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

<nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="img/logo.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="activ"><a href="#">Home</a></li>
            <li><a href="#about">My Account</a></li>
            <li><a href="#contact">Analysis</a></li>
			<li><a href="#contact">About Us</a></li>
			<li><a href="#contact">Helps</a></li>
          </ul>
         
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div id="wrapper">
    	<div class="container">
            <!-- <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0"> -->
                <!-- <div class="navbar-header"> -->
                    <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".top-menu , .sidebar-collapse , .user-img"> -->
                        <!-- <span class="sr-only">Toggle navigation</span> -->
                        <!-- <span class="icon-bar"></span> -->
                        <!-- <span class="icon-bar"></span> -->
                        <!-- <span class="icon-bar"></span> -->
                    <!-- </button> -->
                    <!-- <a class="navbar-brand text-center" href="index.html"><img class="logo" src="img/logo.png"/></a>  -->
                <!-- </div> -->
                
                    <!-- <div class="pull-left top-menu responsive-left-margin" > -->
                        <!-- <a href="index.html">Home</a> -->
                       
                        <!-- <a href="my-account.html">My Account</a> -->
                        <!-- <a href="index.html">Analysis</a> -->
                        <!-- <a href="index.html">About Us</a> -->
                        <!-- <a href="index.html">Help</a> -->
                    <!-- </div>   -->
                    <!-- <!--<div class="pull-left responsive-left-margin" style="margin-top:20px;"> -->
                        <!-- <div class="input-group"> -->
                          <!-- <input type="text" class="form-control search-bar" placeholder="Search..." style="width:250px;"> -->
                          <!-- <span class="input-group-btn"> -->
                            <!-- <button class="btn btn-default" type="button"><span>Go!</span></button> -->
                          <!-- </span> -->
                        <!-- </div> -->
                    <!-- </div>--> 
                    <!-- <ul class="nav navbar-nav navbar-right user-img"> -->
                        <!-- <li class="dropdown"> -->
                          <!-- <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="img/user-img.png" > <span class="caret"></span></a> -->
                          <!-- <ul class="dropdown-menu"> -->
                            <!-- <li><a href="#">Logout</a></li> -->
                          <!-- </ul> -->
                        <!-- </li> -->
                      <!-- </ul> -->
            <!-- </nav> -->
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center sidebar-title">
                        <a class="">My Account</a>
                    </li>
                    <li>
                        <a href="#"> User Profile</a>
                    </li>
					<li class="active">
                        <a href="#"> Admin Profile</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-star-o" aria-hidden="true" style="font-size:20px;"></i>  Rating</a>
                    </li>
                   
                    <li>
                        <a href="#"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
                    </li>  	
                        
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
                      <div class="adm-prf">
					  <h2 style="font-weight:300;"> Result </h2>
					  <hr class="horizontal-line" style="margin: 30px 0;"> 				  
					 
					 <form>
					 <div class="form-group">
					 <label> Positive Response </label>
					 <input type="text" name="positive-response" id="positive-response">%   <br>
					 <label> Negative Response </label>
					 <input type="text" name="negative-response" id="negative-response">%   <br>
					 
					 </div>
					 </form>
					 
					 <div class="pie-chrt">
					 </div>
					 
					 
					 <div class="grph">
					 </div>
					 
						
                    </div>
                </div> 
<div class="row">
<div class="col-md-12">
<div class="lik-imgs">
<ul>
<li><a href="#"> <img src="img/like.jpg"> </a> </li>
<li><a href="#"> <img src="img/dis-like.jpg"> </a> </li>
<div class="result-smnt">
<label> Comments </label><br>
<textarea cols="10" rows="10">  </textarea>
</div>
<div>
</div>
</div>				
                 <!-- /. ROW  -->
                  <hr /> 
                  
                  <div class="row">
                  	<div class="col-xs-12 text-center">
                    	<ul class="footer-links">
                        	<li><a href="index.html">Home</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Analysis</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    	<p style="font-size:12px; padding:0;">© Copyright 2016 Emotionalysis<br>All rights reserved</p>                                       
                    </div>
                  </div>
                          
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
    
   
</body>
</html>
