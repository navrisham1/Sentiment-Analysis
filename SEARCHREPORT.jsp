<%-- 
    Document   : SEARCHREPORT
    Created on : 24 Apr, 2017, 8:44:55 PM
    Author     : pawittar samra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="js/Allstyles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% if(session.getAttribute("usertype")!=null&&session.getAttribute("usertype").equals("Administrator"))
        {
        %>
 
        <%@include file="Header.jsp"%>
        <div class="navigation">
            <jsp:include page="Navigation.jsp"/>
        </div>
        <div class="body">
            <table id="tablearea" border="2" cellpadding="8">
                <tr>
                    <th>User Id</th>
                    <th>Keyword</th>
                    <th>Login Time</th>
                    <th>Logout Time</th
                </tr>
                <tr>
                    <td></td> 
                    <td></td> 
                    <td></td> 
                    <td></td> 

                </tr>
                <tr>
                    <td></td>
                    <td></td> 
                    <td></td> 
                    <td></td> 

                </tr>
                <tr>
                    <td></td>
                    <td></td> 
                    <td></td> 
                    <td></td> 

                </tr>

            </table>
        </div>
        <%}else {
        %>
                 <jsp:forward page="Home.jsp"/>
           
        <%}%>

    </body>
</body>
</html>
