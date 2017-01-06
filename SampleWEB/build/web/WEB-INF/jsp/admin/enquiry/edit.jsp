<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Update Enquiry</h2>
    <br/>
    <form method="post" action="${SITE_URL}/admin/enquiry/save">
        <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" required="required" class="form-control" value="${enquiry.firstName}"/>
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="lastName" required="required" class="form-control" value="${enquiry.lastName}"/>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required="required" class="form-control" value="${enquiry.email}"/>
        </div>
        <div class="form-group">
            <label>Contact No</label>
            <input type="text" name="contactNo" required="required" class="form-control" value="${enquiry.contactNo}"/>
        </div>
        <div class="form-group">
            <label>Message</label>
            <textarea name="message" class="form-control" required="required"/>${enquiry.message}</textarea>
        </div>
        <div class="form-group" > 
            <label>Interested Course</label>
            <select class="form-control" name="course.courseId" > 
                <option value="${enquiry.course.courseId}">${enquiry.course.courseName}</option>
                <option>Select Course</option>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}">${course.courseName}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="form-group" > 
            <label>Enquiry Status Type</label>
            <select class="form-control" name="enquiryStatus.enquiryStatusId" >
                <option value="${enquiry.enquiryStatus.enquiryStatusId}">${enquiry.enquiryStatus.type}</option>
                <option>Select Status type</option>
                <c:forEach var="es" items="${enquiryStatus}">
                    <option value="${es.enquiryStatusId}">${es.type}</option>
                </c:forEach>
            </select> 
        </div>
        <input type="hidden" value="${enquiry.enquiryId}" name="enquiryId"/>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="${SITE_URL}/" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="../../footer.jsp" %>