<%@ page import="com.dreeling.applications.grails.ocelli.Environment" %>



<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'envType', 'error')} required">
	<label for="envType">
		<g:message code="environment.envType.label" default="Env Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="envType" name="envType.id" from="${com.dreeling.applications.grails.ocelli.EnvironmentType.list()}" optionKey="id" required="" value="${environmentInstance?.envType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'environmentDescription', 'error')} ">
	<label for="environmentDescription">
		<g:message code="environment.environmentDescription.label" default="Environment Description" />
		
	</label>
	<g:textField name="environmentDescription" value="${environmentInstance?.environmentDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'environmentName', 'error')} ">
	<label for="environmentName">
		<g:message code="environment.environmentName.label" default="Environment Name" />
		
	</label>
	<g:textField name="environmentName" value="${environmentInstance?.environmentName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: environmentInstance, field: 'nodes', 'error')} ">
	<label for="nodes">
		<g:message code="environment.nodes.label" default="Nodes" />
		
	</label>
	<g:select name="nodes" from="${com.dreeling.applications.grails.ocelli.Node.list()}" multiple="multiple" optionKey="id" size="5" value="${environmentInstance?.nodes*.id}" class="many-to-many"/>

</div>

