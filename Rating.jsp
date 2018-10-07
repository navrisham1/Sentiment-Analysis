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
     <%int id=(Integer)session.getAttribute("userid");
                    %>
<body>
    <%@include file="Header.jsp" %>
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
                
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper  rat" >
            <div id="page-inner rat">
                <div class="row">
                    <div class="col-md-12">
                        
                         
						 
						  <form action="Rating" method="post"> 
						 <div class="rating">
						 <h2 style="color:#02C8FF;">  Rate Us </h2>
						 
						 <fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
</fieldset>
<br>

						 </div>
						 
                                                  </form>
						 
						
						 
						 </div>
						   </div>
						   
						   <div class="row">
						   <div class="col-md-12 col-sm-12 col-xs-12">
						   <div class="rat-cmnts">
						   <label> Comments </label><br>
						   <textarea cols="10" rows="10">  </textarea>
						   </div>
						   </div>
						  <br>
                                                          <br>
                                                       <hr class="horizontal-line" style="margin: 30px 0;"> 

                                                      <br>
                                                          <br>
                                                      <input type="button" value="submit"/>
                        <form>
            
                  
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
