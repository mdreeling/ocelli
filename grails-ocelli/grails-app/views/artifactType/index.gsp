
<%@ page import="com.dreeling.applications.grails.ocelli.ArtifactType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artifactType.label', default: 'ArtifactType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-artifactType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-artifactType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="artifactTypeDescription" title="${message(code: 'artifactType.artifactTypeDescription.label', default: 'Artifact Type Description')}" />
					
						<g:sortableColumn property="artifactTypeName" title="${message(code: 'artifactType.artifactTypeName.label', default: 'Artifact Type Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artifactTypeInstanceList}" status="i" var="artifactTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${artifactTypeInstance.id}">${fieldValue(bean: artifactTypeInstance, field: "artifactTypeDescription")}</g:link></td>
					
						<td>${fieldValue(bean: artifactTypeInstance, field: "artifactTypeName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artifactTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
