<%@ page import="ocelli.grails.AccessKey" %>



<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessKey', 'error')} ">
	<label for="accessKey">
		<g:message code="accessKey.accessKey.label" default="Access Key" />
		
	</label>
	<g:textField name="accessKey" value="${accessKeyInstance?.accessKey}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessKeyId', 'error')} required">
	<label for="accessKeyId">
		<g:message code="accessKey.accessKeyId.label" default="Access Key Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="accessKeyId" type="number" value="${accessKeyInstance.accessKeyId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessPacket', 'error')} ">
	<label for="accessPacket">
		<g:message code="accessKey.accessPacket.label" default="Access Packet" />
		
	</label>
	<g:textField name="accessPacket" value="${accessKeyInstance?.accessPacket}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessType', 'error')} ">
	<label for="accessType">
		<g:message code="accessKey.accessType.label" default="Access Type" />
		
	</label>
	<g:textField name="accessType" value="${accessKeyInstance?.accessType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'accessValue', 'error')} ">
	<label for="accessValue">
		<g:message code="accessKey.accessValue.label" default="Access Value" />
		
	</label>
	<g:textField name="accessValue" value="${accessKeyInstance?.accessValue}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyInstance, field: 'hosts', 'error')} ">
	<label for="hosts">
		<g:message code="accessKey.hosts.label" default="Hosts" />
		
	</label>
	<g:select name="hosts" from="${ocelli.grails.Host.list()}" multiple="multiple" optionKey="id" size="5" value="${accessKeyInstance?.hosts*.id}" class="many-to-many"/>

</div>

