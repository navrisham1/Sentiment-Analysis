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
                var pwd = document.getElementById("txtoldpassword").value.trim();
                if (pwd == "")
                {
                    window.alert("MUST ENTER PASSWORD");
                    return false;
                }
                var pwd = document.getElementById("txtnewpassword").value.trim();
                if (pwd == "")
                {
                    window.alert("MUST ENTER PASSWORD");
                    return false;
                }
                var cnpwd = document.getElementById("txtnewconfirm").value.trim();
                if (cnpwd == "")
                {
                    window.alert("MUST RE-ENTER PASSWORD");
                    return false;
                } else if ("txtpassword" != "txtconfirm")
                {
                    window.alert("CONFIRM PASSWORD MUST MATCH WITH FIRST PASSWORD ENTERED");
                    return false;
                }
            }
        </script>
       </head>
<body>
        <%@include file="Header.jsp" %>
    <div id="wrapper">
    	<div class="container">
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                         <h2>Set New Password</h2> 
                         <hr class="horizontal-line" style="margin: 30px 0;"> 

                    <form class="inner-width" action="SetPassword" method="post" onsubmit="return validForm()">
                              <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">New Password</label>
                                <div class="col-sm-8">
                                  <input type="password" class="form-control" id="txtnewpassword" name="txtnewpassword" placeholder="New Password" style="margin-bottom:60px;">
                                </div>
                              </div>
			<div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Confirm Password</label>
                                <div class="col-sm-8">
                                  <input type="password" class="form-control" id="txtconfirm" placeholder="Confirm Password" style="margin-bottom:60px;">
                                </div>
                        </div>

                            <div class="form-group text-center post-cancel">
                                <button type="submit" class="btn btn-default btn-danger" style="margin:10px 20px;">Confirm</button>
                                <button type="reset" class="btn btn-default btn-danger" style="margin:10px 20px;">Cancel</button>
                            </div>	
                                
                               
                         
                         </form>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr /> 
                  
                  <%@include file="Footer.jsp"%>
                          
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
