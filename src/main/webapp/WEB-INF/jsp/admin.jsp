<%-- 
    Document   : admin
    Created on : May 27, 2016, 3:34:58 PM
    Author     : Morgan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <title>Admin Console</title>

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

    <div class="container">
      <h2 class="sub-header">User Accounts</h2>
      <div class="table-responsive">
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th>UserID</th>
              <th>Username</th>
              <th>Email</th>
              <th>Role</th>
              <th>Enabled</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="entry" items="${usersMap}">
              <tr>
                <td><c:out value="${entry.key.userId}"/></td>
                <td><c:out value="${entry.key.username}"/></td>
                <td><c:out value="${entry.key.email}"/></td>
                <td><c:out value="${entry.value}"/></td>
                <td id="enabled"><c:out value="${entry.key.enabled}"/></td>
                <td>
                  <c:if test="${entry.value ne 'ROLE_ADMIN'}">
                    <c:choose>
                      <c:when test="${entry.key.enabled}">
                        <div>
                          <form:form class="form-horizontal" data-toggle="validator" role="form"
                                 action="/admin/disable" commandName="user">
                            <button type="submit" class="btn btn-warning">Disable</button>
                            <form:input type="hidden" path="username" value="${entry.key.username}" />
                          </form:form>
                        </div>
                      </c:when>
                      <c:otherwise>
                        <div>
                          <form:form class="form-horizontal" data-toggle="validator" role="form"
                                 action="/admin/enable" commandName="user">
                            <button type="submit" class="btn btn-success">Enable</button>
                            <form:input type="hidden" path="username" value="${entry.key.username}" />
                          </form:form>
                        </div>
                      </c:otherwise>
                    </c:choose>
                  </c:if>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
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

