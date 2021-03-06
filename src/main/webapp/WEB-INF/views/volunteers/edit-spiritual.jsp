<%--
Edit form for the volunteer data under the spiritual tab.
Author: oliver.elder.esq
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:set var="pageTitle" value="Edit ${forename} ${surname} Spiritual Information" />
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <body>
        <%@ include file="/WEB-INF/views/common/titlebar.jsp" %>
        <div class="container-fluid">
            <h1>${forename} ${surname} - Spiritual Information</h1>
            <hr>
            <c:url var="formAction" value="${submitUri}" />
            <form:form commandName="volunteerSpiritual" method="PUT" action="${formAction}">
                <fieldset>
                    <label>Congregation</label>
                    <form:input path="congregationName" placeholder="Congregation name" autocomplete="off" />
                    <form:hidden path="congregationId" />
                    <label>Date of baptism</label>
                    <form:input path="baptismDate" placeholder="15/03/1980" class="datepicker" data-date-format="dd/mm/yy" type="text" value=""/>
                    <label>Full time service</label>
                    <form:select path="fulltimeId">
                        <form:option value="" label="None" />
                        <form:options items="${fulltimeValues}" />
                    </form:select>
                    <label>Appointment</label>
                    <form:select path="appointmentId">
                        <form:option value="" label="None (Publisher)" />
                        <form:options items="${appointmentValues}" />
                    </form:select>
                </fieldset>
                <fieldset>
                    <button type="submit" class="btn">Submit</button>
                </fieldset>
            </form:form>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        </div>
        <script type="text/javascript" src="<c:url value='/javascript/jquery-numeric-1.3.1.js' />" ></script>
        <script type="text/javascript" src="<c:url value='/javascript/volunteers.js' />" ></script>
    </body>
</html>

