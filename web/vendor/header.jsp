<%@ page import="Entities.User" %>
<%@ page import="Entities.Languages" %>

<!-- CSS only -->
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel="stylesheet">
<script src="js/script.js"></script>
<%
    String siteName = "Canteen";
%>
<script type="text/javascript" src="js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>

<script>tinymce.init({selector:'textarea'});</script>

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