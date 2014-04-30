<%@ page import="ocelli.grails.Environment" %>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'hosts', 'error')} ">
	<label for="hosts">
		<g:message code="user.hosts.label" default="Hosts" />
		
	</label>
	<g:select name="hosts" from="${ocelli.grails.Host.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.hosts*.id}" class="many-to-many"/>

</div>
<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'envCode', 'error')} ">
	<label for="envCode">
		<g:message code="environment.envCode.label" default="Env Code" />
		
	</label>
	<g:textField name="envCode" value="${environmentInstance?.envCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'envDescription', 'error')} ">
	<label for="envDescription">
		<g:message code="environment.envDescription.label" default="Env Description" />
		
	</label>
	<g:textField name="envDescription" value="${environmentInstance?.envDescription}"/>

</div>

