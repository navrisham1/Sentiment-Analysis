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
    <div id="wrapper">
    	<div class="container">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".top-menu , .sidebar-collapse , .user-img">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand text-center" href="index.html"><img class="logo" src="images/logo.png"/></a> 
                </div>
                
                    <div class="pull-left top-menu responsive-left-margin" >
                        <a href="Home.jsp">Home</a>
                       
                        <a href="ViewProfile.jsp">My Account</a>
                        <a href="Result.jsp?word=analysis">Analysis</a>
                        <a href="#">About Us</a>
                        <a href="Home.jsp">Help</a>
                    </div>  
                   
            </nav>
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
       </div>
       	<!-- /. CONTAINER END -->
	</div>
	
	<section class="about-banner">
	<img src="img/about-us-banner.jpg">
	</section>
	<section class="about-txt">
	<div class="container">
	<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="abt-txt">
	<h1 style="color:#79E1FF;text-align:center;"> Sentiment analysis </h1>
	<p> Sentiment analysis (sometimes known as opinion mining or emotion AI) refers to the use of natural language processing, text analysis, computational linguistics, and biometrics to systematically identify, extract, quantify, and study affective states and subjective information. Sentiment analysis is widely applied to voice of the customer materials such as reviews and survey responses, online and social media, and healthcare materials for applications that range from marketing to customer service to clinical medicine. </p>
	<p> The most common definition describes characteristics of big data as volume, velocity and variety. Volume refers to the massive size of big datasets. Velocity refers to the rate at which data are generated and must be acted upon, such as filtered, reduced, transferred and analyzed, as opposed to store for future processing. Variety refers to the diverse data forms in big data, including structured (tabular such as in a spreadsheet or relational database), unstructured (such as text, imaging, video, and audio), and semi-structured (such as XML documents). 
Today, the textual data on the internet is growing rapidly. Several kinds of industries are trying to use this massive textual data for extracting the people’s views towards their products. Social media is a crucial source of information in this case. It is not possible to manually investigate the heavy amount of data. This is where the requirement of automatic classification becomes clear.
</p>
<h1 style="color:#79E1FF;text-align:center;"> Purpose </h1>

<p> The purpose of the document is to outline the requirements which the Social Mood Swing application must meet. The audience of this document includes:- project developers and customers, and  users who wish to view the project requirements as well as specifications.	 </p>

<h1 style="color:#79E1FF;text-align:center;"> AIM </h1>
<p> > Forecast electoral outcomes before the election occurs <br>
> Compare public sentiment as expressed in social media to the actual election results<br>
>  review the pitfalls of using social media data to generalize for the population at large <br>
>  explain how social media forecasting can help with standard business processes.
</p>
<h1 style="color:#79E1FF;text-align:center;">Advantages </h1>
<p> > Very fast<br>
 > Very cheap as compared to traditional methods <br>
> A social media analysis allows to monitor day-by-day (at the extreme, hour-by-hour) an electoral campaigning<br>
> Good predictive accuracy by its techniques <br>
> Increased accuracy when compared to human processing<br>
The ability to interpret human emotions </p>
	</div>
	</div>
	</div>
	</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	
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
