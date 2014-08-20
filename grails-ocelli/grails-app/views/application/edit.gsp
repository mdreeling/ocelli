<%@ page import="com.dreeling.applications.grails.ocelli.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${applicationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${applicationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			

			
			<g:form class="smart-form" url="[resource:applicationInstance, action:'update']" method="PUT" >
				<header>Edit Application</header>
				<g:hiddenField name="version" value="${applicationInstance?.version}" />
				<fieldset>
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>

	</body>
</html>
