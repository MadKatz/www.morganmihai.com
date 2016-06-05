<%-- 
    Document   : projects
    Created on : May 21, 2016, 11:23:37 PM
    Author     : Morgan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="projects">
    <meta name="author" content="Morgan">
    <link rel="icon" href="">

    <title>My Projects</title>

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
        <h1>Projects!</h1>
        <p>Some of my projects are described below. To view all my projects, <a href="http://github.com/MadKatz">vist my GitHub page</a>.</p>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h2>WinChatLib</h2>
		  <p>IRC style chat library written in C#.</p>
		  <p>Library to create IRC style chat clients and servers. Clients can connect to a server and send & receive messages in a single gobal channel.</p>
          <p><a class="btn btn-default" href="https://github.com/MadKatz/WinChatLib" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>NorthPole</h2>
		  <p>Bing rewards bot written in C# using Selenium.</p>
		  <p>Now defunk due to constant changes to the bing UI. This bot would login and earn bing point by doing bing searches and clicking on the daily offers. Can automate multiple accounts, earn rewards for both PC and Mobile searches and uses threading to reduce execution time.</p>
          <p><a class="btn btn-default" href="https://github.com/MadKatz/NorthPole" role="button">View details &raquo;</a></p>
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

