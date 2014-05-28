<%@ page import="com.dreeling.applications.grails.ocelli.Artifact" %>



<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'artifactLocation', 'error')} ">
	<label for="artifactLocation">
		<g:message code="artifact.artifactLocation.label" default="Artifact Location" />
		
	</label>
	<g:textField name="artifactLocation" value="${artifactInstance?.artifactLocation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artifactInstance, field: 'artifactType', 'error')} required">
	<label for="artifactType">
		<g:message code="artifact.artifactType.label" default="Artifact Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="artifactType" name="artifactType.id" from="${com.dreeling.applications.grails.ocelli.ArtifactType.list()}" optionKey="id" required="" value="${artifactInstance?.artifactType?.id}" class="many-to-one"/>

</div>

