
<%@ page import="com.dreeling.applications.grails.ocelli.EnvironmentType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'environmentType.label', default: 'EnvironmentType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-environmentType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-environmentType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list environmentType">
			
				<g:if test="${environmentTypeInstance?.environmentType}">
				<li class="fieldcontain">
					<span id="environmentType-label" class="property-label"><g:message code="environmentType.environmentType.label" default="Environment Type" /></span>
					
						<span class="property-value" aria-labelledby="environmentType-label"><g:fieldValue bean="${environmentTypeInstance}" field="environmentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentTypeInstance?.environmentTypeDescription}">
				<li class="fieldcontain">
					<span id="environmentTypeDescription-label" class="property-label"><g:message code="environmentType.environmentTypeDescription.label" default="Environment Type Description" /></span>
					
						<span class="property-value" aria-labelledby="environmentTypeDescription-label"><g:fieldValue bean="${environmentTypeInstance}" field="environmentTypeDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentTypeInstance?.environments}">
				<li class="fieldcontain">
					<span id="environments-label" class="property-label"><g:message code="environmentType.environments.label" default="Environments" /></span>
					
						<g:each in="${environmentTypeInstance.environments}" var="e">
						<span class="property-value" aria-labelledby="environments-label"><g:link controller="environment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:environmentTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${environmentTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
