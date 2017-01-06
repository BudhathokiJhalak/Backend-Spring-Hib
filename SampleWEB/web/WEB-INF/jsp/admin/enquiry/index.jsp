<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>
        Listing All Interested people.
    </h2>
    <br/>
    <br/>
    <table class="table table-hover">
        <tr style="background: #c0c0c0">
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Message</th>
            <th>Course Name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="enquiry" items="${enquries}">
            <tr>
                <td>${enquiry.enquiryId}</td>
                <td>${enquiry.firstName} ${enquiry.lastName}</td>
                <td>${enquiry.email}</td>
                <td>${enquiry.contactNo}</td>
                <td>${enquiry.message}</td>
                <td>${enquiry.course.courseName}</td>
                <td style="background: ${enquiry.enquiryStatus.color}">${enquiry.enquiryStatus.type}</td>
                <td>
                    <a href="${SITE_URL}/admin/enquiry/edit/${enquiry.enquiryId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/enquiry/delete/${enquiry.enquiryId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                    <a href="${SITE_URL}/admin/enquiry/mail/${enquiry.enquiryId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-envelope"></span></a>
                </td>
            </tr>
        </c:forEach>
            
    </table>
</div>
<%@include file="../../footer.jsp" %>