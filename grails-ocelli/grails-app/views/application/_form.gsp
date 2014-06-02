<%@ page import="com.dreeling.applications.grails.ocelli.Application" %>



<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'appDescription', 'error')} ">
	<label for="appDescription">
		<g:message code="application.appDescription.label" default="App Description" />
		
	</label>
	<g:textField name="appDescription" value="${applicationInstance?.appDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'appName', 'error')} ">
	<label for="appName">
		<g:message code="application.appName.label" default="App Name" />
		
	</label>
	<g:textField name="appName" value="${applicationInstance?.appName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'artifacts', 'error')} ">
	<label for="artifacts">
		<g:message code="application.artifacts.label" default="Artifacts" />
		
	</label>
	<g:select name="artifacts" from="${com.dreeling.applications.grails.ocelli.Artifact.list()}" multiple="multiple" optionKey="id" size="5" value="${applicationInstance?.artifacts*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationInstance, field: 'environments', 'error')} ">
	<label for="environments">
		<g:message code="application.environments.label" default="Environments" />
		
	</label>
	<g:select name="environments" from="${com.dreeling.applications.grails.ocelli.Environment.list()}" multiple="multiple" optionKey="id" size="5" value="${applicationInstance?.environments*.id}" class="many-to-many"/>

</div>

