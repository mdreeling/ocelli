<%@ page import="com.dreeling.applications.grails.ocelli.EnvironmentType" %>



<div class="fieldcontain ${hasErrors(bean: environmentTypeInstance, field: 'environmentType', 'error')} ">
	<label for="environmentType">
		<g:message code="environmentType.environmentType.label" default="Environment Type" />
		
	</label>
	<g:textField name="environmentType" value="${environmentTypeInstance?.environmentType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentTypeInstance, field: 'environmentTypeDescription', 'error')} ">
	<label for="environmentTypeDescription">
		<g:message code="environmentType.environmentTypeDescription.label" default="Environment Type Description" />
		
	</label>
	<g:textField name="environmentTypeDescription" value="${environmentTypeInstance?.environmentTypeDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentTypeInstance, field: 'environments', 'error')} ">
	<label for="environments">
		<g:message code="environmentType.environments.label" default="Environments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${environmentTypeInstance?.environments?}" var="e">
    <li><g:link controller="environment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="environment" action="create" params="['environmentType.id': environmentTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'environment.label', default: 'Environment')])}</g:link>
</li>
</ul>


</div>

