
<%@ page import="com.dreeling.applications.grails.ocelli.Node" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'node.label', default: 'Node')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-node" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-node" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="node.accessKey.label" default="Access Key" /></th>
					
						<g:sortableColumn property="nodeDescription" title="${message(code: 'node.nodeDescription.label', default: 'Node Description')}" />
					
						<g:sortableColumn property="nodeHostName" title="${message(code: 'node.nodeHostName.label', default: 'Node Host Name')}" />
					
						<g:sortableColumn property="nodeName" title="${message(code: 'node.nodeName.label', default: 'Node Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nodeInstanceList}" status="i" var="nodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nodeInstance.id}">${fieldValue(bean: nodeInstance, field: "accessKey")}</g:link></td>
					
						<td>${fieldValue(bean: nodeInstance, field: "nodeDescription")}</td>
					
						<td>${fieldValue(bean: nodeInstance, field: "nodeHostName")}</td>
					
						<td>${fieldValue(bean: nodeInstance, field: "nodeName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nodeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
