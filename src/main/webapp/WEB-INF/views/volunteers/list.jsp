<%-- 
    Document   : list
    Created on : 20-Sep-2012, 11:33:13
    Author     : rahulsingh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:set var="pageTitle" value="Volunteers" />
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/titlebar.jsp" %>
        <div class="container-fluid">
            <h1>Volunteers</h1>
            <div class="entity-list-results">
                <table class="table table-bordered table-striped table-hover" id="volunteer-list">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Congregation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${volunteers}" var="volunteer">
                            <tr>
                                <td>${volunteer.personId}</td>
                                <td>${volunteer.person.forename}</td>
                                <td>${volunteer.person.surname}</td>
                                <td>${volunteer.congregation.name}</td>
                                <td><a class="btn btn-success" href="<c:url value="/volunteers/${volunteer.personId}" />">View</a>&nbsp;
                                    <a class="btn btn-warning" href="<c:url value="/volunteers/${volunteer.personId}/edit" />">Edit</a>&nbsp;
                                    <a class="btn btn-danger" href="delete">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th><input type="text" name="search_name" value="Search names" class="search_init" /></th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="entity-list-add-new">
                <a class="btn btn-primary" href="<c:url value="/volunteers/new" />">Create new Volunteer</a>
            </div>
            <p>&nbsp;</p>
            <ul class="breadcrumb">
                <li><a href="<c:url value="/" />">ROMS</a> <span class="divider">/</span></li>
                <li class="active">Volunteers</li>
            </ul>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
        <script type="text/javascript" charset="utf8" src="<c:url value='/javascript/circuits.js' />" ></script>
    </body>
</html>
