<%@page import="sentiment.services.ManageUserSearch"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sentiment.services.ManageUserServices"%>
<%@page import="sentiment.bean.UserBean"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Details</title>
        <link href="js/Allstyles.css" rel="stylesheet" type="text/css"/>
        <style>
            .body
            {
                padding-left: 10cm;
            }
        </style>
    </head>
    <body>   
        <jsp:include page="Header.jsp"/>
        <%
            StringBuilder str=new StringBuilder();
            ArrayList<String> al=ManageUserSearch.getSearchedKeyword();
            for(String s:al)
            {
                str.append(s+"\n");
            }
            %>
        <div class="navigation">'
            <h3>Previous searches</h3>
            <textarea rows="5"><%=str%></textarea>
        </div>
        <div class="body">            
            <form action="Analysis" method="post">
                <label for="txtsearch">Enter the keyword</label>
                <input type="text" id="txtsearch" name="txtsearch">
                <input type="submit" value="Analysis">
            </form>
        </div>
     </body>  

</html>
