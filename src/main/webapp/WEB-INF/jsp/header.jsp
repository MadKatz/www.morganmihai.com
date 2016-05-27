<%-- 
    Document   : header
    Created on : May 20, 2016, 10:55:54 PM
    Author     : Morgan
--%>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/home">Home</a>
	  <a class="navbar-brand" href="/projects">Projects</a>
	  <a class="navbar-brand" href="/resume">Resume</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <sec:authorize access="isAnonymous()">
              <a href="/userhome" class="btn btn-success">Login</a>
              <a href="/signup" class="btn btn-success">Sign up</a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
              <a href="/userhome" class="btn btn-success">Account</a>
              <a href="/logout" class="btn btn-success">Logout</a>
            </sec:authorize>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>