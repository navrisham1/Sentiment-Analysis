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

            var carr = ["HRAI", "28ivw", "k4ez", "jw62k", "FH2DE", "gwprp", "4D7YS", "e5hb", "xm9ki", "XDHYN", "6ne3", "q98p"];
            var ran = 0;
            function loadCapcha()
            {
                ran = parseInt((Math.random() * 100) % 12);
                document.getElementById("capch").src = "images/captcha/captcha" + ran + ".jpg";
            }
            function validForm()
            {                         //trim for removing unneccessary spaces
                var un = document.getElementById("txtusername").value.trim();
                if (un == "")
                {
                    window.alert("MUST ENTER USERNAME");
                    document.getElementById("txtusername").focus();
                    return false;
                }
                var name = document.getElementById("txtname").value.trim();
                if (name == "")
                {
                    window.alert("MUST ENTER NAME");
                    return false;
                }
                var contact = document.getElementById("txtcontact").value.trim();
                if (contact == "")
                {
                    window.alert("MUST ENTER CONTACT");
                    return false;
                }
                var email = document.getElementById("txtemail").value.trim();
                if (email == "")
                {
                    window.alert("MUST ENTER E-MAIL");
                    return false;
                }
                var cal = document.getElementById("cval").value;
                if (cal != carr[ran])
                {
                    window.alert("Not Match");
                    document.getElementById("cval").focus();
                    document.getElementById("capchaAlert").innerHTML="Enter the Correct Capcha";
                    loadCapcha();
                    return false;
                }          
                return true;
            }
            function checkExit()
            {
                var xmlhttp = new XMLHttpRequest();
                var username = document.getElementById("txtusername").value;
                var url = "CheckUserName?username=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        if (xmlhttp.responseText.trim() == "Username Already exist")
                        {
                            document.getElementById("isE").style.color = "red";
                            document.getElementById("txtusername").focus();

                        } else
                        {
                            document.getElementById("isE").style.color = "green";
                        }
                        document.getElementById("isE").innerHTML = xmlhttp.responseText.trim();
                    }
                };

                try
                {
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                } catch (e)
                {
                    alert("Unable to connect Server " + e);
                }
            }
        </script>
    </head>
    <body onload="loadCapcha()">
        <jsp:include page="Header.jsp"/>
        <div class="navigation">
        </div>
        
        <div class="body">
            <form action="SignUp" method="post" onsubmit="return validForm()">
                <fieldset>
                    <legend>SignUp</legend>
                    <table>
                        <tr>
                            <td><label for="txtusername">Username:</label></td>
                            <td><input type="text" id="txtusername" name="txtusername" onblur="checkExit()" value="<%=request.getParameter("FName")!=null?request.getParameter("FName"):""%>"><span id="isE"></span></td>
                        </tr>

                        <tr>
                            <td> <label for="txtname">Name:</label></td>
                            <td> <input type="text" id="txtname" name="txtname" value="<%=request.getParameter("FName") %>" /></td>
                        </tr>

                        <tr>
                            <td><label for="txtcontact">Contact:</label></td>
                            <td><input type="number" id="txtcontact" name="txtcontact"></td>
                        </tr>

                           <input type="hidden" id="txtpassword" name="txtpassword"   value="<%=request.getParameter("FName")%>"/>
  
                        <tr>
                            <td><label for="txtemail">E-mail:</label></td>
                            <td><input type="email" id="txtemail" name="txtemail" value="<%=request.getParameter("FEMail") %>"></td>
                        </tr>

                        <tr>
                            <td><label for="gender">Gender:</label></td>
                            <td><input type="radio" name="rbgender" value="Male" checked>Male
                                <input type="radio" name="rbgender" value="Female">Female</td>
                        </tr>
                        <tr>
                            <td><label for="txtdob">D-O-B</label></td>
                            <td> <input type="date" name="txtdob"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><img src="" alt="Captcha" id="capch" height="50" width="150">
                                <input type="button" value="Change" onclick="loadCapcha()"/></td>
                        </tr>
                        <tr>
                            <td><label for="txtcaptcha">Enter captcha:</label></td>
                            <td><input type="text" name="cval" id="cval"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><span id="capchaAlert"></span></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="submit" value="Submit">
                            <input type="reset" value="Reset"></td>
                        </tr>
                    </table> 
                </fieldset> 
            </form>
            <div>
                </body>
                </html>
