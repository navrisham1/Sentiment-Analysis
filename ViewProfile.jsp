<%@page import="sentiment.services.ManageRating"%>
<%@page import="sentiment.bean.RatingBean"%>
<%@page import="sentiment.bean.RatingBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sentiment.services.ManageUserSearch"%>
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
</head>
<body>
    <% if (session.getAttribute("userid") != null) {
        %>
         <%
                int userid = (Integer) (session.getAttribute("userid"));
                //ManageUserServices.copyImage(userid);
                String imgurl = "images/i" + userid + ".jpg";
                UserBean objbean = ManageUserServices.getbyUserId(userid);
                String search = "";
                ArrayList<String> al = ManageUserSearch.getSearchesByUserID(userid);
                for (String s : al) {
                    search += s + "\n";
                }
            %>    
     <jsp:include page="Header.jsp"/>
 <div class="container">
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
            
            <%@include file="Navigation.jsp" %>
        <!-- /. NAV SIDE  -->
        
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">			 
						 <!--<div class="dtls">-->
            <h1 style="color:#02C8FF;"> View Profile </h1>
            <% if(session.getAttribute("logintype").equals("0")){  %>
            <h4> Username: <span id="usr-unm" style="color:#000;"> <%=objbean.getUsername()%> </span> </h4>
            <%}%>
                                                 <h4> Name: <span id="usr-nm" style="color:#000;"> <%=objbean.getName()%> </span> </h4>
                                                 
						 <h4> Gender: <span id="usr-gndr" style="color:#000;"> <%=objbean.isGender() ? "Male" : "Female"%> </span> </h4>
						 <h4> Dob: <span id="usr-db" style="color:#000;"> <%=objbean.getDob()%> </span> </h4>
						 <h4> Contact: <span id="usr-cont" style="color:#000;"> <%=objbean.getContact()%> </span> </h4>
						 <h4> Email: <span id="usr-mail" style="color:#000;"> <%=objbean.getEmail()%> </span> </h4>
						 <a href="EditProfile.jsp?userid=<%=objbean.getUserid()%>"> 
                                                  <button class="btn-new">Edit Profile</button>  </a>
						 <form>
						 <label style="margin-top:10px;"> Previous Searches </label> <br>
						 <textarea placeholder="Previous Searches" style="margin-bottom:20px;"> <%=search%> </textarea><br>
						  <hr class="horizontal-line" style="margin: 30px 0;"> 
						 <%  int count=0,q=0,w=0,e=0,f=0,v=0,z=0,x=0,l=0,k=0;   
            ArrayList<RatingBean>a=ManageRating.getAllRatings();
                   for (RatingBean obj : a)
                    {
                                              int m=obj.getStars();
                       if(m==1)
                       {
                        
                          v+=1;
                       }
                       else if(m==2)
                       {
                          z+=1;
                       }
                       else if(m==3)
                       {
                           x+=1;
                       }
                       else if(m==4)
                       {
                           l+=1;
                         
                       }
                       else
                       {
                          k+=1;
                       }
                  
                    }
            %>   
						 </form>
						 </div>
						 
                            <a name="Analysis">        
                        <form action="Analysis" method="post">
                    <div class="contact-form">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
								<label> Enter The Keyword </label>
                                    <input type="text" class="form-control" placeholder="Enter Keyword" id='txtContactname' name="txtsearch" />
                                </div>
                            </div>
                            </div>

                        <div class="row">
                            
                           <input class="sub-any" type="submit" value="Analyse">
                        </div>
					
                        
                    </div>
			</form>
                            </a>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr /> 
                  
                      <div class="row">
                  	<div class="col-xs-12 text-center">
                    	<ul class="footer-links">
                        	
                            <li><a href="AboutUs.jsp">About Us</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    	<p style="font-size:12px; padding:0;">© Copyright 2017 Emotionalysis<br>All rights reserved</p>                                       
                    </div>
                  </div>
                          
    		</div>
             <!-- /. PAGE INNER  -->
       </div>
         <!-- /. PAGE WRAPPER  -->
         
       </div>
       	<!-- /. CONTAINER END -->
	
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
	</script> --%>
    
    <%} else {
        %>
        <jsp:forward page="Home.jsp"/>
        <%}%>
</body>
</html>
