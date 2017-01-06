<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Add Tutor</h2>
    <form method="post" action="${SITE_URL}/admin/tutor/save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" class="form-control" required="required" value="${tutor.firstName}"/>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="lastName" class="form-control" required="required" value="${tutor.lastName}"/>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required="required" value="${tutor.email}"/>
        </div>
        <div class="form-group">
            <label>Contact No</label>
            <input type="text" name="contactNo" class="form-control" required="required" value="${tutor.contactNo}"/>
        </div>
        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address" class="form-control" required="required" value="${tutor.address}"/>
        </div>

        <div class="form-group" > 
            <label>Course</label>
            <select class="form-control" name="course.courseId"> 
                <option value="${tutor.course.courseId}">${tutor.course.courseName}</option>
                <option>Select Course</option>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}">${course.courseName}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status" <c:if test="${tutor.status}">checked="checked"</c:if>>Active</label>
            </div>
            <input type="hidden" name="tutorId" value="${tutor.tutorId}"/>
            <button type="submit" class="btn btn-success">Save</button>
            <a href="${SITE_URL}/admin/student" class="btn btn-danger">Back</a>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

</div>
<%@include file="../../footer.jsp" %>