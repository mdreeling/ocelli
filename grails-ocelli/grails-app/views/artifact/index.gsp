
<%@ page import="com.dreeling.applications.grails.ocelli.Artifact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artifact.label', default: 'Artifact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-artifact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-artifact" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="artifactLocation" title="${message(code: 'artifact.artifactLocation.label', default: 'Artifact Location')}" />
					
						<th><g:message code="artifact.artifactType.label" default="Artifact Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artifactInstanceList}" status="i" var="artifactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${artifactInstance.id}">${fieldValue(bean: artifactInstance, field: "artifactLocation")}</g:link></td>
					
						<td>${fieldValue(bean: artifactInstance, field: "artifactType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artifactInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
