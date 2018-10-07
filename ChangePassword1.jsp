<%-- 
    Document   : ADDUSER
    Created on : 24 Apr, 2017, 1:37:29 PM
    Author     : pawittar samra
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="js/Allstyles.css" rel="stylesheet" type="text/css"/>
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
        <% if (session.getAttribute("userid")!=null) {
        %>
     <%@include file="Header.jsp" %>
           <div class="navigation">
            <jsp:include page="Navigation.jsp"/>
        </div>
        <div class="body">
            <form action="SavePassword" method="post" onsubmit="return validForm()">
                <fieldset>
                    <legend></legend>
                    <table>
                        <tr>
                            <td><label for="txtoldpassword">Old Password:</label></td>
                            <td><input type="password" id="txtoldpassword" name="txtoldpassword"></td>
                        </tr>
                        <tr>
                            <td><label for="txtnewpassword">New Password:</label></td>
                            <td><input type="password" id="txtpassword" name="txtnewpassword"></td>
                        </tr>

                        <tr>
                            <td> <label for="txtnewconfirm">Confirm Password:</label></td>
                            <td><input type="password" id="txtnewconfirm" name="txtnewconfirm"></td>
                        </tr>

                        <tr>
                            <td><input type="submit" value="Submit"></td>
                            <td> <input type="reset" value="Reset"></td>
                        </tr>
                    </table> 
                </fieldset> 
            </form>
        </div>
       <%}else {
        %>
                 <jsp:forward page="Home.jsp"/>
           
        <%}%>
     </body>
</html>
