<%@page import="sentiment.services.ManageUserServices"%>
<%@page import="sentiment.bean.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sentiment.services.ManageLikeCommentServices"%>
<%@page import="sentiment.services.ManageUserSearch"%>
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

      <script src="js/jquery-3.2.0.js" type="text/javascript"></script>
        <script src="js/canvasjs.min.js" type="text/javascript"></script>
        <script src="js/jquery.canvasjs.min.js" type="text/javascript"></script>
        <link href="js/Allstyles.css" rel="stylesheet" type="text/css"/>
        <script src="js/PieChart.js" type="text/javascript"></script>
        <script src="js/likecomment.js" type="text/javascript"></script>   
        
       </head>
<body>
    <%
            int pos = Integer.parseInt(request.getParameter("pos"));
            int neg = Integer.parseInt(request.getParameter("neg"));
            String word = request.getParameter("word");
            int userid = 0;
            if(session.getAttribute("userid")!=null)
            {
                userid=(Integer)session.getAttribute("userid");
            }
            int sid = ManageUserSearch.getmaxIDofGivennKeyword(word);
            int likefromDB=ManageLikeCommentServices.getLike(userid, sid);
            ArrayList<CommentBean> alcb=ManageLikeCommentServices.getSerchComment(sid);
            String allComment="";
            for(CommentBean cb:alcb)
            {
                allComment+=ManageUserServices.getNameBbyID(cb.getUserid())+" : "+cb.getComment()+"\n";
            }
        %>
        <%@include file="Header.jsp"%>

    <div id="wrapper">
    	<div class="container">
        </div>
        <hr class="horizontal-line">   
        <div class="container">   
           <!-- /. NAV TOP  -->
           <%@include file="Navigation.jsp" %>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        
                      <div class="adm-prf">
					  <h2 style="font-weight:300;"> Result </h2>
					  <hr class="horizontal-line" style="margin: 30px 0;"> 				  
					 
					 <form>
                <input type="hidden" id="userid" value="<%=userid%>" />
                <input type="hidden" id="sid" value="<%=sid%>" />
                <input type="hidden" id="word" value="<%=word%>"/>
                <table>
                    <div>
                        <div style="color:#0000FF"> 
                            <tr>
                                <td>   <label>POSITIVE RESPONSE:</label></td>
                                <td><input type="text" id="txtposresp" name="txtposresp" value="<%=pos%>"></td>
                            </tr> 
                            <tr>
                                <td><label>NEGATIVE RESPONSE:</label></td>
                                <td><input  type="text" id="txtnegresp" name="txtnegresp" value="<%=neg%>"></td>
                            </tr>
                        </div>
                </table>
            </form>
            <!--PieChart-->
            <div id="chartContainer" style="height: 400px; width: 100%;"></div>
            <%if(likefromDB==0){%>
            <img src="img/likewhite.png" id="btnlike" height="60" width="60">
            <img src="img/dis-likewhite.png" id="btndislike" height="60" width="60">
            <%}else if(likefromDB==1){ %>
            <img src="img/like.jpg" id="btnlike" height="60" width="60">
            <img src="img/dis-likewhite.png" id="btndislike" height="60" width="60">            
            <%}else{ %>
            <img src="img/likewhite.png" id="btnlike" height="60" width="60">
            <img src="img/dis-like.jpg" id="btndislike" height="60" width="60">            
            <%}%>
            <br>
            Comments:<br>
            <textarea rows="10" cols="100" id="allcomment"><%=allComment%></textarea><br/>
            <input type ="text" id="txtcomment" placeholder="post your view"/>
            <button value="Post" id="btncomment">Post</button>
					 
					
					 
						
                    </div>
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
    
   
</body>
</html>
