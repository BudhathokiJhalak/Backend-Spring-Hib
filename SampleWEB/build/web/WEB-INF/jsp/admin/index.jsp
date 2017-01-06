<%@include file="../header.jsp" %>
<%@include file="navbar.jsp" %>

<div class="col-md-4 col-md-offset-4">
    <form method="post" class="search-form">
        <div class="form-group has-feedback">
            <label for="search" class="sr-only">Search</label>
            <input type="text" class="form-control" name="search" placeholder="search">
            <span class="glyphicon glyphicon-search form-control-feedback"></span>
        </div>
    </form>
</div>

<%@include file="../footer.jsp" %>