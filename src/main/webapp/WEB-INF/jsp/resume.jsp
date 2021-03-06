<%-- 
    Document   : resume
    Created on : May 21, 2016, 11:29:38 PM
    Author     : Morgan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>Resume</title>

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
	    <div id="resume-header">
		  <h1 class="center-text"><a href="/resources/resumes/MorganMihai_Resume.pdf">PDF</a> - <a href="/resources/resumes/MorganMihai_Resume.docx">DOCX</a></h1>
		  <br></br>
		  <div id="resume-header-left">
		    <p>Morgan Mihai</p>
			<h4>20407 104th Ave NE</h4>
			<h4>Bothell WA, 98011</h4>
		  </div>
		  <div id="resume-header-right">
		    <p>425-327-8136<br> morganmihai@outlook.com </br> <a href="http://www.linkedin.com/pub/morgan-mihai/9b/7b8/849/">www.linkedin.com/pub/morgan-mihai/9b/7b8/849/</a></p>
		  </div>
		  <div id="resume-header-line"></div>
		</div>
		<br></br>
		<h2 class="center-text">Technical Skills</h2>
		<ul class="center-text">
		  <li>C#, Java, HTML/CSS</li>
		  <li>API Testing, UI Testing</li>
		  <li>Junit, TestNG</li>
		  <li>Selenium WebDriver, Selenium Grid</li>
		</ul>
		<br></br>
		<h2 class="center-text">Coding Projects</h2>
		<ul class="center-text">
		  <li>WinChatLib, IRC style chat library for Windows. <a href="http://tinyurl.com/hty3lp5"> http://tinyurl.com/hty3lp5</a></li>
		  <li>Multi-threading search engine crawler bot: <a href="http://tinyurl.com/zcntop2">http://tinyurl.com/zcntop2</a></li>
		  <li>Tetris clone for Windows Phone: <a href="http://tinyurl.com/nek7mwx">http://tinyurl.com/nek7mwx</a></li>
		  <li>CaveStory recreation, translating from C++/SDL to C#/XNA: <a href="http://tinyurl.com/ns3dttp"> http://tinyurl.com/ns3dttp</a></li>
		</ul>
		<br></br>
		<h2 class="center-text">Professional Experience</h2>
		<br></br>
		<p class="company-name"><strong>AMAZON CORPORATION</strong>, Seattle, WA</p>
		<p class="company-year1"><strong>2014-Current</strong></p>
		<p class="position-title">Software Quality Assurance Engineer I, Mobile Appstore</p>
		<ul>
		  <li>Responsible for all testing activities including test plan creation, test case creation, bug ticket creation and management, automated test result monitoring, process improvement, and reporting.</li>
		  <li>Drove end to end testing across multiple systems, teams and time-zones.</li>
		  <li>Developed a Java tool that parses automated tests and generates reports used for test case management, test automation gap analysis and reporting.</li>
		  <li>Designed and developed an automated solution for continuous deployment with Selenium WebDriver, Selenium Grid, TestNG and ANT.</li>
		  <li>Developed Selenium automation for bulk app creation via Amazon Developer Portal. This automation allowed Appstore QA to execute load testing on new downstream services.</li>
		</ul>
	    <br></br>
		<p class="company-name"><strong>MICROSOFT CORPORATION</strong>, Redmond, WA</p>
		<p class="company-year2"><strong>2011-2014</strong></p>
		<p class="position-title">Service Operations I, Test Execution Services - Windows</p>
		<ul>
		  <li>Performed automated test pass execution, triage and support for Windows feature teams.</li>
		  <li>Created process optimization and efficiency improvements. Efficiency gains included, reduced lab costs, increased test capacity and increased test quality.</li>
		  <li>Drove projects within Central Test Execution Services (TEX),</li>
		  <ul>
			<li>Migrating of multiple Windows teams into TEX. Requiring specialty hardware and topologies to be documented and moved into new test labs. Creation of new WTT workflows, Atlas temples and collaborating with stakeholders on creation of test schedules to meet project milestone exit criteria.</li>
			<li>Migration of multiple Windows teams into T3T framework.</li>
		  </ul>
		</ul>
		<div id="resume-header-line">
		</div>
		<div id="resume-footer">
		  <p class="resume-footer">Morgan Mihai - </p>
		  <p class="resume-footer">425-327-8136 - </p>
		  <p class="resume-footer">morganmihai@outlook.com</p>
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
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>