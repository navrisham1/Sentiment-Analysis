<%@page import="sentiment.services.ManageUserServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sentiment.bean.UserBean"%>
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
       <% if(session.getAttribute("usertype")!=null&&session.getAttribute("usertype").equals("Administrator"))
            {
        %>
        <%@include file="Header.jsp" %>
    <div id="wrapper">
    	<div class="container">
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
					  <h2 style="font-weight:300;">Display Information </h2>
					  <hr class="horizontal-line" style="margin: 30px 0;"> 
				
<table class="table">
  <thead>
    <tr>
      <th>Id</th>
      <th>Username</th>
      <th>Name</th>
      <th>Contact</th>
      <th>D-O-B</th>
      <th>Email</th>
      <th>Gender</th>
	  <th>Status</th>
	  <th>User Type</th>
	  <th>Email</th>
	  <th>  </th>
    </tr>
        <%
                        ArrayList<UserBean> al = ManageUserServices.getAllUsers();
                        for (UserBean objbean : al) {
                    %>
                    <tr>
                        <td><%=objbean.getUserid()%></td>
                        <td><%=objbean.getUsername()%></td>
                        <td><%=objbean.getName()%></td>
                        <td><%=objbean.getContact()%></td>
                        <td><%=objbean.getDob()%></td>
                        <td><%=objbean.getEmail()%></td>
                        <td><%=objbean.isGender() ? "Male" : "Female"%></td>
                        <td><%=objbean.isVerify()%></td>
                        <td><%=objbean.getUsertype()%></td>
                            <td><%out.println(objbean.isUserstatus() ? "Active &nbsp;&nbsp;<a href='ChangeStatus?userid=" + objbean.getUserid()
                                + "'>Change</a>" : "Inactive <a href='ChangeStatus?userid=" + objbean.getUserid() + "'>Change</a>");%></td>
                        <td><a href="EditUser.jsp?userid=<%=objbean.getUserid()%> ">Edit</a></td> 
                    </tr>
                    <%}%>
  </thead>
  <tbody>
   <%-- <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
	  <td> </td>
      <td> </td>
      <td> </td>
		<td><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i> </a></td>

    </tr>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
	  <td> </td>
      <td> </td>
      <td> </td>
     <td><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i> </a></td>
    </tr>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
	  <td> </td>
      <td> </td>
      <td> </td>
   <td><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i> </a></td>
    </tr>--%>
  </tbody>
</table>		  
				  
				 
						
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr /> 
                  
                     <div class="row">
                  	<div class="col-xs-12 text-center">
                    	<ul class="footer-links">
                        	
                            <li><a href="#">About Us</a></li>
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
