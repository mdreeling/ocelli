
<%@ page import="com.dreeling.applications.grails.ocelli.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'environment.label', default: 'Environment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-environment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-environment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="environment.envType.label" default="Env Type" /></th>
					
						<g:sortableColumn property="environmentDescription" title="${message(code: 'environment.environmentDescription.label', default: 'Environment Description')}" />
					
						<g:sortableColumn property="environmentName" title="${message(code: 'environment.environmentName.label', default: 'Environment Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${environmentInstanceList}" status="i" var="environmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${environmentInstance.id}">${fieldValue(bean: environmentInstance, field: "envType")}</g:link></td>
					
						<td>${fieldValue(bean: environmentInstance, field: "environmentDescription")}</td>
					
						<td>${fieldValue(bean: environmentInstance, field: "environmentName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${environmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
