<!doctype html>
<html lang="en">
    
<head>
        <meta charset="UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Site title -->
        <title>Emotionalysis</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="google-signin-client_id" content="870023674116-jfu5pqqchvch20oouevag12decr3ailu.apps.googleusercontent.com">
            <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="js/jquery-3.2.0.js" type="text/javascript"></script>
        <!-- Script for Gmail-->
        <script src="js/GmailLogin.js" type="text/javascript"></script>
        <!-- Script for FB -->
        <script src="js/FBLOGIN.js" type="text/javascript"></script>
        <script>
            $(document).ready(function (){
            $("#send").click(function(){
                var name=$("#sname").val().trim();
                var email=$("#email").val().trim();
                var msg=$("#message").val().trim();
                if(name=="")
                {
                    window.alert("Enter your name");
                    $("#alert").val("Enter your name");
                    $("#sname").focus();
                }
                else if(email=="")
                {
                    window.alert("Enter your valid Email");
                    $("#alert").val("Enter your valid Email");
                    $("#email").focus();
                }
                else if(msg=="")
                {
                    window.alert("Enter your Mesage");
                    $("#alert").val("Enter your Mesage");
                    $("#message").focus();
                }
                else
                {
                    $.post("Support",
                    {
                        msg: name+" : "+msg+" \n Address for reply :"+email
                    },
                    function(data)
                    {
                        if(data.trim().equals("sent"))
                        {
                            window.alert("Your responce is recored ");
                            $("#alert").val("Your responce is recored ");
                        }
                        else
                        {
                            window.alert("Sorry can't send responce check your Internet Connection");
                            $("#alert").val("Sorry can't send responce check your Internet Connection");
                        }
                    });
                }
            });
            });
        </script>
    <script>
        function validLoginForm()
        {                         //trim for removing unneccessary spaces
            var un = document.getElementById("txtEmail").value.trim();
            if (un == "")
            {
                window.alert("MUST ENTER Email ID");
                document.getElementById("txtEmail").focus();
                return false;
            }
            var pwd = document.getElementById("txtpassword").value.trim();
            if (pwd == "")
            {
                window.alert("MUST ENTER Password");
                return false;
            }
            return true;
        }
    </script>


        <!-- Favicons AND TOUCH ICONS   -->
        <link rel="icon" href="img/favicon.ico">
        <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

        <!-- Font-awesome and Custom Google Web Font -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/et-line.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400' rel='stylesheet' type='text/css'>

        <!-- CSS --> 
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/allinone_carousel.css" rel="stylesheet" type="text/css">
		<link href="css/jssocials.css" rel="stylesheet">
        <!-- theme style -->
        <link href="css/style.css" rel="stylesheet">

        <!--[if lt IE 9]>
                                <script src="js/html5shiv.js"></script>
                                <script src="js/respond.min.js"></script>
        <![endif]-->
        <script src="js/modernizr.custom.min.js"></script>

        <!-- Style Switch -->
        <link rel="stylesheet" type="text/css" href="css/colors/green.css" title="green" media="screen" />
    </head>
    <body  id="page-top" data-spy="scroll" data-target=".navbar-custom">
        <!-- preloader -->
        
        <!-- <div class="preloader"> -->
            <!-- <div class="status"> -->
                <!-- <img src="images/logo.png" alt="loading..."/> -->
            <!-- </div> -->
        <!-- </div> -->


        <!-- Header -->
        <header>
            <nav class="navbar navbar-custom navbar-top navbar-fixed-top sticky-navigation" >
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- LOGO -->
                        <a class="navbar-brand nav-logo page-scroll" href="#page-top">
                            <img src="images/logo.png"/>
                        </a>
                    </div>
                    <!-- NAVIGATION LINKS -->
                    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a class="page-scroll" href="Home.jsp">Home</a></li>
                            <li><a class="page-scroll" href="AboutUs.jsp">About us</a></li>
                            <li><a class="page-scroll" href="#logg">Login</a></li>
                            <li><a class="page-scroll" href="SignUp.jsp">Sign Up</a></li>
                            <li><a class="page-scroll" href="FreeTrail.jsp">Free Trail</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->

                </div><!-- /.container -->
            </nav>
        </header><!-- Header end -->
		
		<section class="slider-head">
		<div class="container">
		<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
		<h1 class="slide-txt"> Emotionalysis </h1>
		</div>
		</div>
		</div>
		</section>
		</section>
		

        <section id="intro" >
            <div class="container">
                 <a name="logg">
                <div class="row relative">
                    <img src="img/hand.png" class="intro-mobile img-responsive"/>
                    <div class="col-md-5 col-md-offset-7">
                        <p class="space40">
                            Please <strong>login</strong> here to access your <strong>account</strong>.
                        </p>
                        
                        <form action="Login" method="post" onsubmit="validLoginForm()">
                                <input type="email" placeholder="Email ID" id="txtEmail" name="txtEmail" class="form-control" style="border:1px solid #555;">
                                <input type="password" placeholder="password" id="txtpassword" name="txtpassword" class="form-control" style="border:1px solid #555;">
                                
                                <a href="ForgotPassword.jsp" style="color:#F00;"><small>Forget Password ?</small></a><br><br>
                                <button class="btn-new">Login</button>  
                        </form>
                        <span style="font-size:20px; padding:0 30px 0;">OR</span><br>
                                <a href="SignUp.jsp" ><button class="btn-new">Create Account</button></a>
                                <br><br>
                    <div class="g-signin2" data-onsuccess="onSignIn">Login With Gmail</div>
                    <br>
                    <div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" 
                         data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();">Log in with FB</div>
                       
      
                    </div><!-- col-md-6 end -->
                </div><!-- row end -->
                 </a>
                
            </div><!-- container end -->
        </section><!-- intro end -->
        </a>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titleSection">
                            <h2>We are here to  <span class="bold">Analyze </span> World</h2>
                            <p>
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry.  
                            </p>
                            <div class="coloredLine"></div>
                        </div><!-- titleSection end -->
                    </div><!-- col-md-12 end -->
                </div><!-- row end -->

                <div class="row space50">
                    <div class="col-md-12">
                        <!--<img src="images/mob-bg.jpg" class="img-responsive"/>-->
                    </div><!-- col-md-12 end --> 
                </div><!-- row end -->   

                <div class="row">
                    <div class="col-md-4 mg-sm-100" >
                        <i class="icon-browser bigIcon"></i>
                        <h4 class="bold">Very Fast</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                        </p>
                    </div><!-- col-md-4 end -->

                    <div class="col-md-4  mg-sm-100" >
                        <i class="icon-happy bigIcon"></i>
                        <h4 class="bold">Good and Increased Predictive Accurscy</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                        </p>
                    </div><!-- col-md-4 end -->

                    <div class="col-md-4" >
                        <i class="icon-tools bigIcon"></i>
                        <h4 class="bold">Social Media Analysis</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                        </p>
                    </div><!-- col-md-4 end -->

                </div><!-- row end -->
            </div><!-- container end -->
        </section>  <!-- overview end -->

        <!-- features -->
        <section id="features" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titleSection">
                            <h2>Very cheap as compared  <span class="bold">Traditional Methods</span></h2>
                            <p>
                               Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                            </p>
                            <div class="coloredLine"></div>
                        </div><!-- titleSection end -->
                    </div><!-- col-md-12 end -->
                </div><!-- row end -->

                <div class="row">
                    <div class="col-md-4 leftFeatures">
                        <div class="text-right space100">
                            <i class="icon-heart bigIcon"></i>
                            <h4 class="bold">Ability To Analysis Human Emotions</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                            </p>
                        </div><!-- text-right space100 end -->

                        <div class="text-right">
                            <i class="icon-bike bigIcon"></i>
                            <h4 class="bold">Analyse Current Issues
							</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                            </p>
                        </div><!-- text-right end -->

                    </div><!-- col-md-4 leftFeatures end -->

                    <div class="col-md-4">
                        <img src="images/features-mob.png" class="img-responsive wow bounceIn" alt="features"  data-wow-duration="1s" data-wow-offset="50" data-wow-delay="0s" />
                    </div><!-- col-md-4 end -->

                    <div class="col-md-4 rightFeatures">
                        <div class="text-left space100">
                            <i class="icon-hotairballoon bigIcon"></i>
                            <h4 class="bold">Open to All</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                            </p>
                        </div><!-- text-left space40 end -->

                        <div class="text-left">
                            <i class="icon-camera bigIcon"></i>
                            <h4 class="bold">Accurate Prediction</h4>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique
                            </p>
                        </div><!-- text-left end -->
                    </div><!-- col-md-4 rightFeatures end -->

                </div><!-- row end -->
            </div><!-- container end -->
        </section>  <!-- features end -->


        <section id="app-brief1" class="section" >
            <div class="container">
                <div class="row relative">
                    <div class="phones">
                        <img src="images/left-mob-front.jpg"  class="left-mob-front img-responsive"/>
                        <img src="images/left-mob-back.png" class="left-mob-back img-responsive wow fadeInUp" data-wow-duration="1s" data-wow-offset="50" data-wow-delay="0s"/>
                    </div>
                    <div class="col-md-6 col-md-offset-6">
                        <h2>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti</h2>

                        <p class="space40">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi enim, vulputate at justo tristique.
                        </p>

                        <ul class="clearlist rightList">
                            <li>
                                <i class="fa fa-check"></i>
                                <span>   Et harum quidem rerum facilis</span>
                            </li>

                            <li>
                                <i class="fa fa-check"></i>
                                <span>  Itaque earum rerum</span>
                            </li>

                            <li>
                                <i class="fa fa-check"></i>
                                <span> omnis voluptas assumenda est, omnis dolor repellendus. </span>
                            </li>

                        </ul>
                    </div><!-- col-md-6 end -->
                </div><!-- row end -->
            </div><!-- container end -->
        </section><!-- #app-brief1 section end -->

        <section id="app-brief2" class="section" >
            <div class="container">
                <div class="row relative">
                    <div class="phones">
                        <img src="images/right-mob-front.png" class="right-mob-front img-responsive"/>
                        <img src="images/right-mob-back.png" class="right-mob-back img-responsive wow fadeInUp" data-wow-duration="1s" data-wow-offset="50" data-wow-delay="0s"/>
                    </div>
                    <div class="col-md-6">
                        <h2>Social <span class="bold">  Mood Swing </span> Application  </h2>

                        <p class="space40">
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                        <p>
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                        </p>


                    </div><!-- col-md-6 end -->
                </div><!-- row end -->
            </div><!-- container end -->
        </section><!-- #app-brief2 section end -->



        <!-- contact -->
        <section id="contact" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titleSection">
                            <h2>Get In Touch <span class="bold">Say Hello!</span></h2>
                            <div class="coloredLine"></div>
                        </div><!-- titleSection end -->
                    </div><!-- col-md-12 end -->
                </div><!-- row end -->
                <a name="responce">
                <div class="row">
                    <!-- contact form -->
                    <form>
                        <div class="col-md-6 col-md-offset-3">
                            <span id="alert"></span>
                            <input  id="sname" type="text" class="form-control"  name="name" placeholder="Your Name">
                            <input  id="email" type="email" class="form-control"  name="email" placeholder="Your Email" >
                            <textarea class="form-control" id="message"  rows="5" placeholder="Message"></textarea>                           
                            <a href="responce"><button class="btn-new" id="sendq">Send Message</button></a>
                            </div>
                    </form>
                </div><!-- row end -->
                </a>
            </div><!-- container end -->
        </section><!-- contact end -->

        <footer>
            <div class="container">
                <div class="col-md-12">
                    <a href="#page-top" class="page-scroll"><img src="images/footer-logo.png"/></a>
                    <div class="space50"></div>
                    <ul  class="clearlist socialList">
                        <li><a href="#logg"><i class="fa fa-facebook"></i><span class="hidden-xs"> Facebook </span></a></li>
                        <li><a href="#logg"><i class="fa fa-twitter"></i><span class="hidden-xs">Twitter</span></a></li>
                        <li><a href="#logg"><i class="fa fa-linkedin"></i><span class="hidden-xs">Linkedin</span></a></li>
                       
                    </ul>
                    <hr>
                    <p>&copy; Copyright <strong>Emotionalysis</strong> | All Right Reserved | 2016</p>
                </div><!-- col-md-12 end -->
            </div><!-- container end -->
        </footer>

        <!-- javascript Placed at the end of the document so the pages load faster -->
        <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/jquery.appear.js"></script>
        <script src="js/jquery.inview.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
        <script src="js/allinone_carousel.js" type="text/javascript"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/pace.min.js" type="text/javascript"></script>
        <script src="js/jquery.placeholder.min.js" type="text/javascript"></script>
        <script src="js/jssocials.min.js"></script>
        <script src="js/script.js"></script>

    </body>

</html>