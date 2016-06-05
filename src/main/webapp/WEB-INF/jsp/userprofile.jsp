<%-- 
    Document   : userprofile
    Created on : May 25, 2016, 10:59:21 PM
    Author     : Morgan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="www.morganmihai.com">
    <meta name="author" content="Morgan">
    <link rel="icon" href="">

    <title>User profile</title>

    <!-- Bootstrap core CSS -->
    <!-- Custom styles for this template -->
    <style type="text/css">
    <%@include file="/resources/css/jumbotron.css" %>
    <%@include file="/resources/css/bootstrap.min.css" %>
    <%@include file="/resources/css/ie10-viewport-bug-workaround.css" %>
    </style>
  </head>

  <body>

    <%@ include file="header.jsp" %>
    <div class="container" id="userprofile">
      <div class="row">
        <div class="col-md-7 col-md-offset-2">
          <form:form class="form-horizontal" data-toggle="validator" role="form"
                   action="/userprofile/update" commandName="user">
            <c:if test="${param.success != null}">
              <div class="alert alert-success">
                <p>Update successful!</p>
              </div>
            </c:if>
            <c:if test="${param.pwdsuccess != null}">
              <div class="alert alert-success">
                <p>Password update successful!</p>
              </div>
            </c:if>
            <c:if test="${param.invalidString != null}">
              <div class="alert alert-success">
                <p>Invalid First/Last name.</p>
              </div>
            </c:if>
            <fieldset>
              <legend>Account Profile</legend>
              <div class="form-group">
                <form:label for="inputFirstName" path="firstName" class="col-sm-2 control-label">First Name</form:label>
                <div class="col-sm-4">
                  <form:input type="text" path="firstName" id="inputFirstName" class="form-control" required="tue"/>
                </div>
                <form:label for="inputLastName" path="lastName" class="col-sm-2 control-label">Last Name</form:label>
                <div class="col-sm-4">
                  <form:input type="text" path="lastName" id="inputLastName" class="form-control" required="true" />
                </div>
              </div>
              <div class="form-group">
                <form:label for="inputUsername" path="username" class="col-sm-2 control-label">Username</form:label>
                <div class="col-sm-10">
                  <form:input type="text" path="username" id="inputUsername" class="form-control" disabled="true" />
                </div>
              </div>
              <div class="form-group">
                <form:label for="inputEmail" path="email" class="col-sm-2 control-label">Email</form:label>
                <div class="col-sm-10">
                  <form:input type="text" path="email" id="inputEmail" class="form-control" disabled="true" />
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword" path="password" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-3">
                  <input type="password" path="password" id="inputPassword" value="*************" class="form-control" disabled="tue"/>
                </div>
                <a href="userprofile/pwdupdate" class="btn btn-default">Update password</a>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="pull-right">
                    <a href="userhome" class="btn btn-default">Cancel</a>
                    <button type="submit" class="btn btn-primary">Update</button>
                  </div>
                </div>
              </div>
            </fieldset>
          </form:form>
        </div><!-- /.col-lg-12 -->
      </div><!-- /.row -->
    </div>

    <%@ include file="footer.jsp" %>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/resources/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/validator.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>