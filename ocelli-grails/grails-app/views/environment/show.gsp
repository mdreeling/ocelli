
<%@ page import="ocelli.grails.Environment" %>
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
				
				<g:if test="${environmentInstance?.hosts}">
				<li class="fieldcontain">
					<span id="hosts-label" class="property-label"><g:message code="user.host.label" default="Hosts" /></span>
					
						<g:each in="${environmentInstance.hosts}" var="p">
						<span class="property-value" aria-labelledby="hosts-label"><g:link controller="host" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${environmentInstance?.envCode}">
				<li class="fieldcontain">
					<span id="envCode-label" class="property-label"><g:message code="environment.envCode.label" default="Env Code" /></span>
					
						<span class="property-value" aria-labelledby="envCode-label"><g:fieldValue bean="${environmentInstance}" field="envCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${environmentInstance?.envDescription}">
				<li class="fieldcontain">
					<span id="envDescription-label" class="property-label"><g:message code="environment.envDescription.label" default="Env Description" /></span>
					
						<span class="property-value" aria-labelledby="envDescription-label"><g:fieldValue bean="${environmentInstance}" field="envDescription"/></span>
					
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
