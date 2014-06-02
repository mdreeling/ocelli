
<%@ page import="com.dreeling.applications.grails.ocelli.Application" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'application.label', default: 'Application')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-application" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-application" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list application">
			
				<g:if test="${applicationInstance?.appDescription}">
				<li class="fieldcontain">
					<span id="appDescription-label" class="property-label"><g:message code="application.appDescription.label" default="App Description" /></span>
					
						<span class="property-value" aria-labelledby="appDescription-label"><g:fieldValue bean="${applicationInstance}" field="appDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.appName}">
				<li class="fieldcontain">
					<span id="appName-label" class="property-label"><g:message code="application.appName.label" default="App Name" /></span>
					
						<span class="property-value" aria-labelledby="appName-label"><g:fieldValue bean="${applicationInstance}" field="appName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.artifacts}">
				<li class="fieldcontain">
					<span id="artifacts-label" class="property-label"><g:message code="application.artifacts.label" default="Artifacts" /></span>
					
						<g:each in="${applicationInstance.artifacts}" var="a">
						<span class="property-value" aria-labelledby="artifacts-label"><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${applicationInstance?.environments}">
				<li class="fieldcontain">
					<span id="environments-label" class="property-label"><g:message code="application.environments.label" default="Environments" /></span>
					
						<g:each in="${applicationInstance.environments}" var="e">
						<span class="property-value" aria-labelledby="environments-label"><g:link controller="environment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:applicationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
