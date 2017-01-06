<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>
        Listing All Tutors..
    </h2>
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/tutor/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
        </p>
    </div>
    <table class="table table-hover">
        <tr style="background: #c0c0c0">
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Address</th>
            <th>Course Name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="tutor" items="${tutors}">
            <tr>
                <td>${tutor.tutorId}</td>
                <td>${tutor.firstName} ${tutor.lastName}</td>
                <td>${tutor.email}</td>
                <td>${tutor.contactNo}</td>
                <td>${tutor.address}</td>
                <td>${tutor.course.courseName}</td>
                <td>
                    <c:choose>
                        <c:when test="${tutor.status}">
                            Active
                        </c:when>
                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${SITE_URL}/admin/tutor/edit/${tutor.tutorId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/tutor/delete/${tutor.tutorId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                    <a href="${SITE_URL}/admin/tutor/mail/${tutor.tutorId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-envelope"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../../footer.jsp" %>