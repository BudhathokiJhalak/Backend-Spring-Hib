<%@include file="header.jsp" %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${SITE_URL}"> Sample Web</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${SITE_URL}/login"><span class="glyphicon glyphicon-log-in"></span> Admin Login</a></li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="container">
        <h2><p class="text-center">Please Login</p></h2>
    </div>
    <c:if test="${not empty error}">
        <div class="error"><p class="text-center" style="color: red">${error}</p></div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg"><p class="text-center" style="color: red">${msg}</p></div>
    </c:if>

    <form class="form-horizontal" method="post" >
        <div class="form-group">
            <label class="control-label col-sm-2">Email / Username:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="username" placeholder="Enter email or username">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Password:</label>
            <div class="col-sm-10"> 
                <input type="password" class="form-control" name="password" placeholder="Enter password">
            </div>
        </div>
        <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label><input type="checkbox" name="remember-me"> Remember me</label>
                </div>
            </div>
        </div>
        <div class="form-group"> 
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

</div>
<%@include file="footer.jsp" %>