<%@ page import="Entities.Publications" %>
<%@ page import="Entities.Languages" %>
<div class="container mt-2">
    <div class="row">
        <div class="col-sm-2">
            <select class="form-select" aria-label="Default select example" name="languageValue">
                <%
                    ArrayList<Languages> languages = (ArrayList<Languages>) request.getAttribute("languages");
                    if (languages != null) {
                        for (Languages language : languages
                        ) {
                %>
                <a class="nav-link active" href="/index?lng=<%=language.getCode()%>">
                    <option value="<%=language.getId()%>">
                        <%=language.getCode()%>
                    </option>
                </a>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="col-sm-6 mx-auto">
            <h2>WORLD NEWS PORTAL</h2>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-sm bg-success navbar-dark">
    <div class="container-fluid">
        <ul class="navbar-nav">
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