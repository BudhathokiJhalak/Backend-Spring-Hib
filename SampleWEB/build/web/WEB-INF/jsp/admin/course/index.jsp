<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Listing All Courses</h2>
    
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/course/add" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"> Add</span></a>
        </p>
    </div>

    <table class="table table-hover">
        <tr style="background: #c0c0c0">
            <th>ID</th>
            <th>Course Name</th>
            <th>Description</th>
            <th>Fees(NRs)</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.courseId}</td>
                <td>${course.courseName}</td>
                <td>${course.description}</td>
                <td>${course.fees}</td>
                <td>
                    <c:choose>
                        <c:when test="${course.status}">
                            Active
                        </c:when>
                        <c:otherwise>
                            Inactive
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="${SITE_URL}/admin/course/edit/${course.courseId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/course/delete/${course.courseId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
        
</div>
<%@include file="../../footer.jsp" %>