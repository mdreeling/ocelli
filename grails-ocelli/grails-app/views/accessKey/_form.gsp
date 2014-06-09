<%@ page import="com.dreeling.applications.grails.ocelli.AccessKey" %>



<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessKeyType', 'error')} required">
	<label for="accessKeyType">
		<g:message code="accessKey.accessKeyType.label" default="Access Key Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="accessKeyType" name="accessKeyType.id" from="${com.dreeling.applications.grails.ocelli.AccessKeyType.list()}" optionKey="id" required="" value="${accessKeyInstance?.accessKeyType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'data', 'error')} ">
	<label for="data">
		<g:message code="accessKey.data.label" default="Data" />
		
	</label>
	<g:textArea name="data" value="${accessKeyInstance?.data}" rows="5" cols="40"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'nodes', 'error')} ">
	<label for="nodes">
		<g:message code="accessKey.nodes.label" default="Nodes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accessKeyInstance?.nodes?}" var="n">
    <li><g:link controller="node" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="node" action="create" params="['accessKey.id': accessKeyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'node.label', default: 'Node')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'principal', 'error')} ">
	<label for="principal">
		<g:message code="accessKey.principal.label" default="Principal" />
		
	</label>
	<g:textField name="principal" value="${accessKeyInstance?.principal}"/>

</div>

