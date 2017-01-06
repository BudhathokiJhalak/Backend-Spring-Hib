<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <div>
        <p>
        <h2>Add Enquiry Status Type</h2>
        </p>
    </div>
    <form action="${SITE_URL}/admin/enquirystatus/save", method="post">
        <div class="form-group">
            <label>Status type</label>
            <input type="text" name="type" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Color</label>
            <input type="text" name="color" class="form-control" required="required"/>
        </div>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${SITE_URL}/admin/enquirystatus" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="../../footer.jsp" %>