<%--
    Document   : list
    Created on : 20-Sep-2012, 11:33:13
    Author     : rahulsingh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:set var="pageTitle" value="People" />
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/titlebar.jsp" %>
        <div class="container-fluid">
            <h1>People</h1>
            <hr>
            <div class="entity-list-results">
                <table class="table table-bordered table-striped table-hover" id="person-list">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Congregation</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

            <p>&nbsp;</p>
            <ul class="breadcrumb">
                <li><a href="<c:url value="/" />">ROMS</a> <span class="divider">/</span></li>
                <li class="active">Persons</li>
            </ul>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
        <script id="list-action" type="text/html">
            <ul class="inline list-actions">
                {{#uri}}<li><a class="btn btn-success" href="{{uriBase}}{{uri}}">View</a></li>{{/uri}}
                {{#editUri}}<li><a class="list-action" href="{{uriBase}}{{editUri}}">Edit</a></li>{{/editUri}}
                {{#deleteUri}}<li><a class="list-action" href="{{uriBase}}{{deleteUri}}">Delete</a></li>{{/deleteUri}}
            </ul>
        </script>
        <script type="text/javascript" src="<c:url value='/javascript/persons.js' />" ></script>
    </body>
</html>
