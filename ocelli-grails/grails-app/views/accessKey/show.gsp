
<%@ page import="ocelli.grails.AccessKey" %>
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
			
				<g:if test="${accessKeyInstance?.accessKey}">
				<li class="fieldcontain">
					<span id="accessKey-label" class="property-label"><g:message code="accessKey.accessKey.label" default="Access Key" /></span>
					
						<span class="property-value" aria-labelledby="accessKey-label"><g:fieldValue bean="${accessKeyInstance}" field="accessKey"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.accessKeyId}">
				<li class="fieldcontain">
					<span id="accessKeyId-label" class="property-label"><g:message code="accessKey.accessKeyId.label" default="Access Key Id" /></span>
					
						<span class="property-value" aria-labelledby="accessKeyId-label"><g:fieldValue bean="${accessKeyInstance}" field="accessKeyId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.accessPacket}">
				<li class="fieldcontain">
					<span id="accessPacket-label" class="property-label"><g:message code="accessKey.accessPacket.label" default="Access Packet" /></span>
					
						<span class="property-value" aria-labelledby="accessPacket-label"><g:fieldValue bean="${accessKeyInstance}" field="accessPacket"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.accessType}">
				<li class="fieldcontain">
					<span id="accessType-label" class="property-label"><g:message code="accessKey.accessType.label" default="Access Type" /></span>
					
						<span class="property-value" aria-labelledby="accessType-label"><g:fieldValue bean="${accessKeyInstance}" field="accessType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.accessValue}">
				<li class="fieldcontain">
					<span id="accessValue-label" class="property-label"><g:message code="accessKey.accessValue.label" default="Access Value" /></span>
					
						<span class="property-value" aria-labelledby="accessValue-label"><g:fieldValue bean="${accessKeyInstance}" field="accessValue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyInstance?.hosts}">
				<li class="fieldcontain">
					<span id="hosts-label" class="property-label"><g:message code="accessKey.hosts.label" default="Hosts" /></span>
					
						<g:each in="${accessKeyInstance.hosts}" var="h">
						<span class="property-value" aria-labelledby="hosts-label"><g:link controller="host" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
