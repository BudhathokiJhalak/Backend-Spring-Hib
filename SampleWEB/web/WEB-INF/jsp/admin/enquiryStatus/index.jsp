<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <h2>Listing All Enquiry Status Type.</h2>
    <div class="pull-right">
        <p>
            <a href="${SITE_URL}/admin/enquirystatus/add" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span></a>
        </p>
    </div>
    <table class="table table-hover">
        <tr style="background: #c0c0c0">
            <th>ID</th>
            <th>Status type</th>
            <th>Color</th>
            <th>Action</th>
        </tr>
        <c:forEach var="es" items="${enquiryStatus}">
            <tr>
                <td>${es.enquiryStatusId}</td>
                <td>${es.type}</td>
                <td>${es.color}</td>
                <td>
                    <a href="${SITE_URL}/admin/enquirystatus/edit/${es.enquiryStatusId}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
                    <a href="${SITE_URL}/admin/enquirystatus/delete/${es.enquiryStatusId}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="../../footer.jsp" %>