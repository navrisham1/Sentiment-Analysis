<%@page import="sentiment.services.ManageUserSearch"%>
<%@page import="java.util.ArrayList"%>
<% 
    ArrayList<String> keywords=ManageUserSearch.getSearchedKeyword();
    String keyword=keywords.get(keywords.size()-1);
%>

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
            <li><a href="Home.jsp">Home</a></li>           
            <li><a href="ViewProfile.jsp#Analysis">Analysis</a></li>
            <li><a href="SignUp.jsp" >Sign Up </a></li>
        <li><a href="FreeTrail.jsp">Free Trail</a></li>                       
        <% if (session.getAttribute("usertype") != null && session.getAttribute("usertype").equals("Administrator")) {
        %>

    <li><a href='ManageUser.jsp'>Manage User</a></li>
    <li><a href='AddUser.jsp'>Add User</a></li>
        <%}%>
        <%  if (session.getAttribute("logintype") == null || (Integer)session.getAttribute("logintype")==0) 
           
        { %>
    <li><a href='ChangePassword.jsp'>Change Password</a></li>
        <%}%>
          </ul>
         
        </div><!--/.nav-collapse -->
      </div>
    </nav>
