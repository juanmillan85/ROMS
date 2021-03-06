<%--
    Document   : circuitEdit/Create
    Created on : 14-Jul-2012, 00:54:53
    Author     : oliver.elder.esq
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:set var="pageTitle" value="Create/Edit Circuit" />
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/titlebar.jsp" %>
        <div class="container-fluid">
            <h1>Circuit</h1>
            <hr>
            <c:url var="formAction" value="/circuits" />
            <form:form commandName="circuitForm" method="post" action="${formAction}">
                <fieldset>
                    <legend>Circuit Details</legend>
                    <form:hidden path="circuitId"/>
                    <label>Circuit Name:</label>
                    <form:input path="name" maxlength="50" placeholder="Circuit Name" class="span2"/><br />
                </fieldset>
                <br />
                <fieldset>
                    <legend>Circuit Overseer Details</legend>
                    <div class="controls controls-row">
                        <div id="circuit-overseer-linked" class="controls alert span9" style="display:none;">
                            <button type="button" class="close">Unlink</button>
                            Linked to an existing person in the database
                        </div>
                    </div>
                    <form:hidden path="personId" />
                    <div class="control-group">
                        <label>Name Details:</label>
                        <form:input path="forename" maxlength="50" placeholder="First Name" class="span2"/><br />
                        <form:input path="middleName" maxlength="50" placeholder="Middle Name" class="span2"/><br />
                        <form:input path="surname" maxlength="50" placeholder="Surname" class="span2"/><br />
                    </div>
                    <div class="control-group">
                        <label>Email:</label>
                        <form:input path="email" maxlength="50" placeholder="E-mail" class="span3"/><br />
                    </div>
                    <div class="control-group">
                        <label>Address:</label>
                        <form:input path="street" maxlength="70" placeholder="Street" class="span3"/><br />
                        <form:input path="town" maxlength="30" placeholder="Town" class="span2"/><br />
                        <form:input path="county" maxlength="50" placeholder="County" class="span2"/><br />
                        <form:input path="postcode" maxlength="10" placeholder="Postcode" class="span1"/><br />
                    </div>
                    <div class="control-group">
                        <label>Phones:</label>
                        <form:input path="telephone" maxlength="20" placeholder="Telephone Number" class="span2"/><br />
                        <form:input path="mobile" maxlength="20" placeholder="Mobile Number" class="span2"/>
                    </div>
                </fieldset>
                <c:choose>
                    <c:when test="${circuitForm.forename != null && circuitForm.surname != null}">
                        <fieldset>
                            <div class="controls controls-row">
                                <div class="alert alert-info span9" id="edit-circuit-overseer-person" style="display:none;">
                                    Click this link if you would like to edit the circuit overseer 
                                    <a href="<c:url value="/persons/${circuitForm.personId}/edit"/>"><b>${circuitForm.forename} ${circuitForm.surname}</b></a>
                                </div>
                            </div>
                        </fieldset>
                    </c:when>
                </c:choose>
                <fieldset>
                    <div class="controls controls-row">
                        <input type="submit" class="btn btn-primary" />
                    </div>
                </fieldset>
            </div>
        </form:form>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

    <!-- Mustache template for displaying the person link, use of mustaches {{}} -->
    <script id="circuit-overseer-link-form" type="text/html">
        {{#existingPersonId}}
        <p>The name is already linked to <b>{{existingPersonName}}</b></p>
        <p><a href="#" class="matched-person" data-person-id="{{existingPersonId}}">Leave linked to {{existingPersonName}} (same as ignore)</a></p>
        <p><a href="#" class="matched-person" data-person-id="">Unlink {{existingPersonName}} (create a new person)</a></p>
        {{/existingPersonId}}
        {{#matchedPersons}}
        <p>Link to an existing person:</p>
        {{#results}}
        <a href="#" class="matched-person" data-person-id="{{personId}}">{{forename}} {{surname}}{{#congregationName}}, {{congregationName}}{{/congregationName}}</a>
        {{/results}}
        {{/matchedPersons}}
    </script>

    <div id="circuit-overseer-modal" class="modal hide fade">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3>Select Matching Person</h3>
        </div>
        <div class="modal-body">

        </div>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Ignore</a>
        </div>
    </div>
    <script type="text/javascript" src="<c:url value='/javascript/circuits.js' />" ></script>
</body>
</html>
