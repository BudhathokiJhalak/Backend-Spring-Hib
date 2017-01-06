<%@include file="header.jsp" %>
<div class="container">
    <h2>Edit Enquiry</h2>
    <br/>
    <form method="post" action="${SITE_URL}/send">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" required="required" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="lastName" required="required" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required="required" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Contact No</label>
            <input type="text" name="contactNo" required="required" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Message</label>
            <textarea name="message" class="form-control" required="required"/></textarea>
        </div>
        <div class="form-group" > 
            <label>Interested Course</label>
            <select class="form-control" name="course.courseId" > 
                <option>Select Course</option>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}">${course.courseName}</option>
                </c:forEach>
            </select> 
        </div>
        <input type="hidden" value="1" name="enquiryStatus.enquiryStatusId"/>
        <button type="submit" class="btn btn-primary">Send</button>
        <a href="${SITE_URL}/" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="footer.jsp" %>