
<%@ page import="com.dreeling.applications.grails.ocelli.Artifact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-artifact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-artifact" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artifact">
			
				<g:if test="${artifactInstance?.artifactLocation}">
				<li class="fieldcontain">
					<span id="artifactLocation-label" class="property-label"><g:message code="artifact.artifactLocation.label" default="Artifact Location" /></span>
					
						<span class="property-value" aria-labelledby="artifactLocation-label"><g:fieldValue bean="${artifactInstance}" field="artifactLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artifactInstance?.artifactType}">
				<li class="fieldcontain">
					<span id="artifactType-label" class="property-label"><g:message code="artifact.artifactType.label" default="Artifact Type" /></span>
					
						<span class="property-value" aria-labelledby="artifactType-label"><g:link controller="artifactType" action="show" id="${artifactInstance?.artifactType?.id}">${artifactInstance?.artifactType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:artifactInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${artifactInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
