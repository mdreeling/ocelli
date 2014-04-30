<%@ page import="ocelli.grails.Host" %>



<div class="fieldcontain ${hasErrors(bean: hostInstance, field: 'hostName', 'error')} ">
	<label for="hostName">
		<g:message code="host.hostName.label" default="Host Name" />
		
	</label>
	<g:textField name="hostName" value="${hostInstance?.hostName}"/>

</div>

