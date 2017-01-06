<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Add Student</h2>
    <form method="post" action="${SITE_URL}/admin/student/save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="lastName" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Contact No</label>
            <input type="text" name="contactNo" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Address</label>
            <input type="text" name="address" class="form-control" required="required"/>
        </div>
        
        <div class="form-group" > 
            <label>Course</label>
            <select class="form-control" name="course.courseId"> 
                <option>Select Course</option>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}">${course.courseName}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="checkbox">
            <label>Status</label>
            <label><input type="checkbox" name="status">Active</label>
        </div>
        <button type="submit" class="btn btn-success">Save</button>
        <a href="${SITE_URL}/admin/student" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

</div>
<%@include file="../../footer.jsp" %>