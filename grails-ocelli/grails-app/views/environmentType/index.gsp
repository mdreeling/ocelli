
<%@ page import="com.dreeling.applications.grails.ocelli.EnvironmentType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'environmentType.label', default: 'EnvironmentType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-environmentType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-environmentType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="environmentType" title="${message(code: 'environmentType.environmentType.label', default: 'Environment Type')}" />
					
						<g:sortableColumn property="environmentTypeDescription" title="${message(code: 'environmentType.environmentTypeDescription.label', default: 'Environment Type Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${environmentTypeInstanceList}" status="i" var="environmentTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${environmentTypeInstance.id}">${fieldValue(bean: environmentTypeInstance, field: "environmentType")}</g:link></td>
					
						<td>${fieldValue(bean: environmentTypeInstance, field: "environmentTypeDescription")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${environmentTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
