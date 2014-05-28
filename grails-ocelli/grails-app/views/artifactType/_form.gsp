<%@ page import="com.dreeling.applications.grails.ocelli.ArtifactType" %>



<div class="fieldcontain ${hasErrors(bean: artifactTypeInstance, field: 'artifactTypeDescription', 'error')} ">
	<label for="artifactTypeDescription">
		<g:message code="artifactType.artifactTypeDescription.label" default="Artifact Type Description" />
		
	</label>
	<g:textField name="artifactTypeDescription" value="${artifactTypeInstance?.artifactTypeDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artifactTypeInstance, field: 'artifactTypeName', 'error')} ">
	<label for="artifactTypeName">
		<g:message code="artifactType.artifactTypeName.label" default="Artifact Type Name" />
		
	</label>
	<g:textField name="artifactTypeName" value="${artifactTypeInstance?.artifactTypeName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artifactTypeInstance, field: 'artifacts', 'error')} ">
	<label for="artifacts">
		<g:message code="artifactType.artifacts.label" default="Artifacts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${artifactTypeInstance?.artifacts?}" var="a">
    <li><g:link controller="artifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="artifact" action="create" params="['artifactType.id': artifactTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'artifact.label', default: 'Artifact')])}</g:link>
</li>
</ul>


</div>

