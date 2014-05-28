
<%@ page import="com.dreeling.applications.grails.ocelli.ArtifactType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artifactType.label', default: 'ArtifactType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artifactType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artifactType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artifactType">
			
				<g:if test="${artifactTypeInstance?.artifactTypeDescription}">
				<li class="fieldcontain">
					<span id="artifactTypeDescription-label" class="property-label"><g:message code="artifactType.artifactTypeDescription.label" default="Artifact Type Description" /></span>
					
						<span class="property-value" aria-labelledby="artifactTypeDescription-label"><g:fieldValue bean="${artifactTypeInstance}" field="artifactTypeDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artifactTypeInstance?.artifactTypeName}">
				<li class="fieldcontain">
					<span id="artifactTypeName-label" class="property-label"><g:message code="artifactType.artifactTypeName.label" default="Artifact Type Name" /></span>
					
						<span class="property-value" aria-labelledby="artifactTypeName-label"><g:fieldValue bean="${artifactTypeInstance}" field="artifactTypeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artifactTypeInstance?.artifacts}">
				<li class="fieldcontain">
					<span id="artifacts-label" class="property-label"><g:message code="artifactType.artifacts.label" default="Artifacts" /></span>
					
						<g:each in="${artifactTypeInstance.artifacts}" var="a">
						<span class="property-value" aria-labelledby="artifacts-label"><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:artifactTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${artifactTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
