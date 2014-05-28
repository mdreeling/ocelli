
<%@ page import="com.dreeling.applications.grails.ocelli.AccessKeyType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessKeyType.label', default: 'AccessKeyType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-accessKeyType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-accessKeyType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list accessKeyType">
			
				<g:if test="${accessKeyTypeInstance?.accessKeyTypeDescription}">
				<li class="fieldcontain">
					<span id="accessKeyTypeDescription-label" class="property-label"><g:message code="accessKeyType.accessKeyTypeDescription.label" default="Access Key Type Description" /></span>
					
						<span class="property-value" aria-labelledby="accessKeyTypeDescription-label"><g:fieldValue bean="${accessKeyTypeInstance}" field="accessKeyTypeDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyTypeInstance?.accessKeyTypeName}">
				<li class="fieldcontain">
					<span id="accessKeyTypeName-label" class="property-label"><g:message code="accessKeyType.accessKeyTypeName.label" default="Access Key Type Name" /></span>
					
						<span class="property-value" aria-labelledby="accessKeyTypeName-label"><g:fieldValue bean="${accessKeyTypeInstance}" field="accessKeyTypeName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessKeyTypeInstance?.accessKeys}">
				<li class="fieldcontain">
					<span id="accessKeys-label" class="property-label"><g:message code="accessKeyType.accessKeys.label" default="Access Keys" /></span>
					
						<g:each in="${accessKeyTypeInstance.accessKeys}" var="a">
						<span class="property-value" aria-labelledby="accessKeys-label"><g:link controller="accessKey" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:accessKeyTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${accessKeyTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
