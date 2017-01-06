<%@include file="../../header.jsp" %>
<%@include file="../navbar.jsp" %>
<div class="container">
    <form method="post" action="${SITE_URL}/admin/mail/send">
        <h2>Send Email</h2>
        <div class="form-group" > 
            <label>To</label>
            <input type="text" value="${students.email}" name="to" placeholder="${students.firstName}"/>
        </div>
        <div class="form-group" > 
            <label>From</label>
            <select class="form-control" name="from"> 
                <option>Select Mail Address</option>
                <c:forEach var="ma" items="${mailingAddress}">
                    <option value="${ma.email}">${ma.name}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="form-group" > 
            <label>ISP</label>
            <select class="form-control" name="hostName"> 
                <option>Select ISP</option>
                <c:forEach var="isp" items="${isps}">
                    <option value="${isp.value}">${isp.name}</option>
                </c:forEach>
            </select> 
        </div>
        <div class="form-group">
            <label>Subject</label>
            <input type="text" name="subject" class="form-control" required="required"/>
        </div>
        <div class="form-group">
            <label>Message</label>
            <textarea name="message" class="form-control" required="required"/></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Send</button>
        <a href="${SITE_URL}/admin/student" class="btn btn-danger">Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>
<%@include file="../../footer.jsp" %>