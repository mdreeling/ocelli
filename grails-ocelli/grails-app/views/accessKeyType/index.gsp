
<%@ page import="com.dreeling.applications.grails.ocelli.AccessKeyType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessKeyType.label', default: 'AccessKeyType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-accessKeyType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-accessKeyType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="accessKeyTypeDescription" title="${message(code: 'accessKeyType.accessKeyTypeDescription.label', default: 'Access Key Type Description')}" />
					
						<g:sortableColumn property="accessKeyTypeName" title="${message(code: 'accessKeyType.accessKeyTypeName.label', default: 'Access Key Type Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accessKeyTypeInstanceList}" status="i" var="accessKeyTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accessKeyTypeInstance.id}">${fieldValue(bean: accessKeyTypeInstance, field: "accessKeyTypeDescription")}</g:link></td>
					
						<td>${fieldValue(bean: accessKeyTypeInstance, field: "accessKeyTypeName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accessKeyTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
