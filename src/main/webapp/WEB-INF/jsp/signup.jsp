<%-- 
    Document   : signup
    Created on : May 21, 2016, 11:41:07 PM
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
    <link rel="shortcut icon" href="">

    <title>Sign-up</title>

    <!-- Bootstrap core CSS -->
    <!-- Custom styles for this template -->
    <style type="text/css">
    <%@include file="/resources/css/jumbotron.css" %>
    <%@include file="/resources/css/bootstrap.min.css" %>
    <%@include file="/resources/css/ie10-viewport-bug-workaround.css" %>
    </style>
  </head>

  <body id="login">

    <%@ include file="header.jsp" %>

    <div class="container">
      <c:url var="register" value="/signup/register" ></c:url>
      <form:form class="form-signin" data-toggle="validator" role="form"
                 action="${register}" commandName="user">
        <c:if test="${param.emailf != null}">
            <div class="alert alert-danger">
                <p>Email already registered.</p>
            </div>
        </c:if>
        <c:if test="${param.usernamef != null}">
            <div class="alert alert-danger">
                <p>Username already registered.</p>
            </div>
        </c:if>
        <c:if test="${param.validationError != null}">
            <div class="alert alert-danger">
                <p>One or more string were invalid or empty.</p>
            </div>
        </c:if>
        <c:choose>
          <c:when test="${param.success != null}">
              <div class="alert alert-success">
                  <p>Account created!</p>
                  <a href="signin.htm" class="btn btn-success">Sign-in</a>
              </div>
          </c:when>
          <c:otherwise>
            <h2 class="form-signin-heading">Account Information</h2>
            <div class="form-group">
              <label for="inputFirstName" path="firstName" class="sr-only">First Name</label>
              <form:input type="text" path="firstName" class="form-control" id="inputFirstName" placeholder="First Name" autofocus="autofocus" required="true" />
            </div>
            <div class="form-group">
              <label for="inputLastName" class="sr-only">Last Name</label>
              <form:input type="text" path="lastName" class="form-control" id="inputLastName" placeholder="Last Name" required="true" />
            </div>
            <div class="form-group">
              <label for="inputEmail" class="sr-only">Email address</label>
              <form:input type="email" path="email" id="inputEmail" class="form-control" placeholder="Email address" required="true"
                          data-error="Invalid email address."/>
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
              <label for="inputUsername" path="username" class="sr-only">Username</label>
              <form:input type="text" path="username" id="inputUsername" class="form-control" placeholder="Username" required="true" />
            </div>  
            <div class="form-group">
              <label for="inputPassword" class="sr-only">Password</label>
              <form:input type="password" path="password" data-minlength="6" id="inputPassword" class="form-control" placeholder="Password" required="true" />
              <div class="help-block">Minimum of 6 characters</div>
            </div>
            <div class="form-group">
              <label for="inputPassword_confirm" class="sr-only">Confirm Password</label>
              <input type="password" id="inputPassword_confirm" data-match="#inputPassword" data-match-error="Whoops, these don't match" class="form-control" placeholder="Confirm Password" required>
              <div class="help-block with-errors">
              </div>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
          </c:otherwise>
        </c:choose>
      </form:form>
    </div> <!-- /container -->
    
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