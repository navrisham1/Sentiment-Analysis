<%@page import="sentiment.services.ManageUserServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(ManageUserServices.isUserNamePresent(request.getParameter("username")))
    {
        out.println("Username Already exist");
    }
    else
    {
        out.println("Username is Valid");
    }
 %>