
<%@ page import="com.dreeling.applications.grails.ocelli.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'environment.label', default: 'Environment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-environment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-environment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list environment">
			
				<g:if test="${environmentInstance?.envType}">
				<li class="fieldcontain">
					<span id="envType-label" class="property-label"><g:message code="environment.envType.label" default="Env Type" /></span>
					
						<span class="property-value" aria-labelledby="envType-label"><g:link controller="environmentType" action="show" id="${environmentInstance?.envType?.id}">${environmentInstance?.envType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentInstance?.environmentDescription}">
				<li class="fieldcontain">
					<span id="environmentDescription-label" class="property-label"><g:message code="environment.environmentDescription.label" default="Environment Description" /></span>
					
						<span class="property-value" aria-labelledby="environmentDescription-label"><g:fieldValue bean="${environmentInstance}" field="environmentDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentInstance?.environmentName}">
				<li class="fieldcontain">
					<span id="environmentName-label" class="property-label"><g:message code="environment.environmentName.label" default="Environment Name" /></span>
					
						<span class="property-value" aria-labelledby="environmentName-label"><g:fieldValue bean="${environmentInstance}" field="environmentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentInstance?.nodes}">
				<li class="fieldcontain">
					<span id="nodes-label" class="property-label"><g:message code="environment.nodes.label" default="Nodes" /></span>
					
						<g:each in="${environmentInstance.nodes}" var="n">
						<span class="property-value" aria-labelledby="nodes-label"><g:link controller="node" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:environmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${environmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
