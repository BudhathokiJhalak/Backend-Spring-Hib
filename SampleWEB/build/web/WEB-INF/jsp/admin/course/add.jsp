<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Add Course</h2>
    <form method="post" action="${SITE_URL}/admin/course/save">
        <div class="form-group">
            <label>Course Name</label>
            <input type="text" name="courseName" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" required="required"/></textarea>
        </div>
        <div class="form-group">
            <label>Fees(NRs)</label>
            <input type="text" name="fees" class="form-control" required="required"/>
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status">Active</label>
        </div>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${SITE_URL}/admin/course" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="../../footer.jsp" %>