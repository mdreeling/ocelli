<%@ page import="com.dreeling.applications.grails.ocelli.Node" %>



<div class="fieldcontain ${hasErrors(bean: nodeInstance, field: 'accessKey', 'error')} required">
	<label for="accessKey">
		<g:message code="node.accessKey.label" default="Access Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="accessKey" name="accessKey.id" from="${com.dreeling.applications.grails.ocelli.AccessKey.list()}" optionKey="id" required="" value="${nodeInstance?.accessKey?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nodeInstance, field: 'artifacts', 'error')} ">
	<label for="artifacts">
		<g:message code="node.artifacts.label" default="Artifacts" />
		
	</label>
	<g:select name="artifacts" from="${com.dreeling.applications.grails.ocelli.Artifact.list()}" multiple="multiple" optionKey="id" size="5" value="${nodeInstance?.artifacts*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nodeInstance, field: 'nodeDescription', 'error')} ">
	<label for="nodeDescription">
		<g:message code="node.nodeDescription.label" default="Node Description" />
		
	</label>
	<g:textField name="nodeDescription" value="${nodeInstance?.nodeDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nodeInstance, field: 'nodeHostName', 'error')} ">
	<label for="nodeHostName">
		<g:message code="node.nodeHostName.label" default="Node Host Name" />
		
	</label>
	<g:textField name="nodeHostName" value="${nodeInstance?.nodeHostName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nodeInstance, field: 'nodeName', 'error')} ">
	<label for="nodeName">
		<g:message code="node.nodeName.label" default="Node Name" />
		
	</label>
	<g:textField name="nodeName" value="${nodeInstance?.nodeName}"/>

</div>

