
<%@ page import="ocelli.grails.AccessKey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessKey.label', default: 'AccessKey')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-accessKey" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-accessKey" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="accessKey" title="${message(code: 'accessKey.accessKey.label', default: 'Access Key')}" />
					
						<g:sortableColumn property="accessKeyId" title="${message(code: 'accessKey.accessKeyId.label', default: 'Access Key Id')}" />
					
						<g:sortableColumn property="accessPacket" title="${message(code: 'accessKey.accessPacket.label', default: 'Access Packet')}" />
					
						<g:sortableColumn property="accessType" title="${message(code: 'accessKey.accessType.label', default: 'Access Type')}" />
					
						<g:sortableColumn property="accessValue" title="${message(code: 'accessKey.accessValue.label', default: 'Access Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accessKeyInstanceList}" status="i" var="accessKeyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accessKeyInstance.id}">${fieldValue(bean: accessKeyInstance, field: "accessKey")}</g:link></td>
					
						<td>${fieldValue(bean: accessKeyInstance, field: "accessKeyId")}</td>
					
						<td>${fieldValue(bean: accessKeyInstance, field: "accessPacket")}</td>
					
						<td>${fieldValue(bean: accessKeyInstance, field: "accessType")}</td>
					
						<td>${fieldValue(bean: accessKeyInstance, field: "accessValue")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accessKeyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
