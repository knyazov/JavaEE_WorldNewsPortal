<%@ page import="Entities.Publications" %>
<%@ page import="Entities.Languages" %>

<nav class="navbar navbar-expand-sm bg-success navbar-dark">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="/index">
                    ALL NEWS
                </a>
            </li>
            <%
                ArrayList<Publications> publications = (ArrayList<Publications>) request.getAttribute("allPublications");
                if (publications != null) {
                    for (Publications p :
                            publications) {
            %>
            <li class="nav-item">
                <a class="nav-link active" href="/index?pName=<%=p.getName()%>"><%=p.getName()%>
                </a>
            </li>
            <%
                    }
                }
            %>

        </ul>
    </div>
</nav>