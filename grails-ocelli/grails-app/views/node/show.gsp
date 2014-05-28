
<%@ page import="com.dreeling.applications.grails.ocelli.Node" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-node" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-node" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list node">
			
				<g:if test="${nodeInstance?.accessKey}">
				<li class="fieldcontain">
					<span id="accessKey-label" class="property-label"><g:message code="node.accessKey.label" default="Access Key" /></span>
					
						<span class="property-value" aria-labelledby="accessKey-label"><g:link controller="accessKey" action="show" id="${nodeInstance?.accessKey?.id}">${nodeInstance?.accessKey?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${nodeInstance?.artifacts}">
				<li class="fieldcontain">
					<span id="artifacts-label" class="property-label"><g:message code="node.artifacts.label" default="Artifacts" /></span>
					
						<g:each in="${nodeInstance.artifacts}" var="a">
						<span class="property-value" aria-labelledby="artifacts-label"><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${nodeInstance?.nodeDescription}">
				<li class="fieldcontain">
					<span id="nodeDescription-label" class="property-label"><g:message code="node.nodeDescription.label" default="Node Description" /></span>
					
						<span class="property-value" aria-labelledby="nodeDescription-label"><g:fieldValue bean="${nodeInstance}" field="nodeDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nodeInstance?.nodeHostName}">
				<li class="fieldcontain">
					<span id="nodeHostName-label" class="property-label"><g:message code="node.nodeHostName.label" default="Node Host Name" /></span>
					
						<span class="property-value" aria-labelledby="nodeHostName-label"><g:fieldValue bean="${nodeInstance}" field="nodeHostName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nodeInstance?.nodeName}">
				<li class="fieldcontain">
					<span id="nodeName-label" class="property-label"><g:message code="node.nodeName.label" default="Node Name" /></span>
					
						<span class="property-value" aria-labelledby="nodeName-label"><g:fieldValue bean="${nodeInstance}" field="nodeName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:nodeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${nodeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
