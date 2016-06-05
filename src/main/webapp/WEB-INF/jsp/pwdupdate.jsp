<%-- 
    Document   : pwdupdate
    Created on : May 26, 2016, 1:54:35 PM
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

    <title>Update password</title>

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
                   action="/userprofile/pwdupdate" commandName="passwordUpdate">
            <c:if test="${param.invalidString != null}">
              <div class="alert alert-danger">
                <p>Invalid password.</p>
              </div>
            </c:if>
            <c:if test="${param.denied != null}">
              <div class="alert alert-danger">
                <p>Password did not match record on file.</p>
              </div>
            </c:if>
            <fieldset>
              <legend>Update Password</legend>
              <div class="form-group">
                <form:label for="inputOldPassword" path="oldPassword" class="col-sm-4 control-label">Current Password</form:label>
                <div class="col-sm-4">
                  <form:input type="password" path="oldPassword" id="inputOldPassword" class="form-control" placeholder="Old Password" required="tue"/>
                </div>
              </div>
              <div class="form-group">
                <form:label for="inputNewPassword" path="newPassword" class="col-sm-4 control-label">New Password</form:label>
                <div class="col-sm-4">
                  <form:input type="password" path="newPassword" id="inputNewPassword" data-minlength="6" class="form-control" placeholder="New Password" required="true" />
                </div>
                <div class="help-block">Minimum of 6 characters</div>
              </div>
              <div class="form-group">
                <label for="inputConfirmNewPassword" class="col-sm-4 control-label">Confirm Password</label>
                <div class="col-sm-4">
                  <input type="password" id="inputConfirmNewPassword" data-minlength="6" data-match="#inputNewPassword" placeholder="Confirm Password"
                         data-match-error="Whoops, these don't match" class="form-control" required>
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-5 col-sm-10">
                  <a href="/userprofile" class="btn btn-default">Cancel</a>
                  <button type="submit" class="btn btn-primary">Update</button>
                </div>
              </div>
            </fieldset>
          </form:form>
        </div>
      </div>
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