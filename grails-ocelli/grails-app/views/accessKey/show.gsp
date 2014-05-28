
<%@ page import="com.dreeling.applications.grails.ocelli.AccessKey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessKey.label', default: 'AccessKey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-accessKey" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-accessKey" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list accessKey">
			
				<g:if test="${accessKeyInstance?.accessKeyType}">
				<li class="fieldcontain">
					<span id="accessKeyType-label" class="property-label"><g:message code="accessKey.accessKeyType.label" default="Access Key Type" /></span>
					
						<span class="property-value" aria-labelledby="accessKeyType-label"><g:link controller="accessKeyType" action="show" id="${accessKeyInstance?.accessKeyType?.id}">${accessKeyInstance?.accessKeyType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="accessKey.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:fieldValue bean="${accessKeyInstance}" field="data"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.nodes}">
				<li class="fieldcontain">
					<span id="nodes-label" class="property-label"><g:message code="accessKey.nodes.label" default="Nodes" /></span>
					
						<g:each in="${accessKeyInstance.nodes}" var="n">
						<span class="property-value" aria-labelledby="nodes-label"><g:link controller="node" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.principal}">
				<li class="fieldcontain">
					<span id="principal-label" class="property-label"><g:message code="accessKey.principal.label" default="Principal" /></span>
					
						<span class="property-value" aria-labelledby="principal-label"><g:fieldValue bean="${accessKeyInstance}" field="principal"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:accessKeyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${accessKeyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
