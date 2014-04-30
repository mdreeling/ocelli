<%@ page import="ocelli.grails.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileDescription', 'error')} ">
	<label for="profileDescription">
		<g:message code="profile.profileDescription.label" default="Profile Description" />
		
	</label>
	<g:textField name="profileDescription" value="${profileInstance?.profileDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileName', 'error')} ">
	<label for="profileName">
		<g:message code="profile.profileName.label" default="Profile Name" />
		
	</label>
	<g:textField name="profileName" value="${profileInstance?.profileName}"/>

</div>

