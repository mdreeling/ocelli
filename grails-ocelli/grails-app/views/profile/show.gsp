
<%@ page import="com.dreeling.applications.grails.ocelli.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profile">
			
				<g:if test="${profileInstance?.applications}">
				<li class="fieldcontain">
					<span id="applications-label" class="property-label"><g:message code="profile.applications.label" default="Applications" /></span>
					
						<g:each in="${profileInstance.applications}" var="a">
						<span class="property-value" aria-labelledby="applications-label"><g:link controller="application" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.profileDesc}">
				<li class="fieldcontain">
					<span id="profileDesc-label" class="property-label"><g:message code="profile.profileDesc.label" default="Profile Desc" /></span>
					
						<span class="property-value" aria-labelledby="profileDesc-label"><g:fieldValue bean="${profileInstance}" field="profileDesc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.profileName}">
				<li class="fieldcontain">
					<span id="profileName-label" class="property-label"><g:message code="profile.profileName.label" default="Profile Name" /></span>
					
						<span class="property-value" aria-labelledby="profileName-label"><g:fieldValue bean="${profileInstance}" field="profileName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
