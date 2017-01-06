<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Update Course</h2>
    <form method="post" action="${SITE_URL}/admin/course/save">
        <div class="form-group">
            <label>Course Name</label>
            <input type="text" name="courseName" class="form-control" required="required" value="${course.courseName}"/>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" required="required"/>${course.description}</textarea>
        </div>
        <div class="form-group">
            <label>Fees(NRs)</label>
            <input type="text" name="fees" class="form-control" required="required" value="${course.fees}"/>
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status" <c:if test="${course.status}">checked="checked"</c:if>>Active</label>
        </div>
        <input type="hidden" name="courseId" value="${course.courseId}"/>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${SITE_URL}/admin/course" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="../../footer.jsp" %>