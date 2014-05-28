<%@ page import="com.dreeling.applications.grails.ocelli.AccessKeyType" %>



<div class="fieldcontain ${hasErrors(bean: accessKeyTypeInstance, field: 'accessKeyTypeDescription', 'error')} ">
	<label for="accessKeyTypeDescription">
		<g:message code="accessKeyType.accessKeyTypeDescription.label" default="Access Key Type Description" />
		
	</label>
	<g:textField name="accessKeyTypeDescription" value="${accessKeyTypeInstance?.accessKeyTypeDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyTypeInstance, field: 'accessKeyTypeName', 'error')} ">
	<label for="accessKeyTypeName">
		<g:message code="accessKeyType.accessKeyTypeName.label" default="Access Key Type Name" />
		
	</label>
	<g:textField name="accessKeyTypeName" value="${accessKeyTypeInstance?.accessKeyTypeName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accessKeyTypeInstance, field: 'accessKeys', 'error')} ">
	<label for="accessKeys">
		<g:message code="accessKeyType.accessKeys.label" default="Access Keys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accessKeyTypeInstance?.accessKeys?}" var="a">
    <li><g:link controller="accessKey" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="accessKey" action="create" params="['accessKeyType.id': accessKeyTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'accessKey.label', default: 'AccessKey')])}</g:link>
</li>
</ul>


</div>

