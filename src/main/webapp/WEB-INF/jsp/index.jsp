<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="www.morganmihai.com">
    <meta name="author" content="Morgan">
    <link href="/favicon.ico" rel="icon" type="image/x-icon">

    <title>Morgan Mihai</title>

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

    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>Welcome to the home page of Morgan Mihai's personal website! You've traveled far and must be weary.
		Please take your time and browse my wears.</p>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h2>Spring Has Sprung!</h2>
          <h6>May. 2016</h6>
          <p>Spring, Hibernate, when your powers combine...they form account registration and login support! <a href="/signup">Sign up today!</a></p>
        </div>
        <div class="col-md-4">
          <h2>Site moved to bootstrap!</h2>
          <h6>May. 2016</h6>
          <p>Website moves to boostrap. Exciting stuff people.</p>
        </div>
        <div class="col-md-4">
          <h2>Website Launched!</h2>
          <h6>Dec. 2015 </h6>
          <p>www.morganmihai.com is alive! </p>
       </div>
      </div>

      <hr>
    </div> <!-- /container -->
    <%@ include file="footer.jsp" %>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/resources/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

