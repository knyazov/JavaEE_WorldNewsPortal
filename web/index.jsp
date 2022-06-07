<%@ page import="java.util.ArrayList" %>
<%@ page import="Entities.News" %><%--
  Created by IntelliJ IDEA.
  User: Akzhol
  Date: 04.06.2022
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="vendor/header.jsp" %>
</head>
<body>
<%@include file="vendor/navbar.jsp" %>
<div class="container">
    <div class="row row-cols-1 row-cols-md-2 g-4 mt-2">

        <%
            ArrayList<News> allNews = (ArrayList<News>) request.getAttribute("allNews");
            if (allNews != null) {
                for (News news : allNews) {
        %>
        <div class="col">
            <div class="card">
                <img src="<%=news.getPictureUrl()%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h6 class="card-header"><%=news.getPublications().getName()%>
                    </h6>
                    <h5 class="card-title"><%=news.getTitle()%>
                    </h5>
                    <p class="card-text"><%=news.getShortContent()%>
                    </p>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
