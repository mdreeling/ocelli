<%@ page import="com.dreeling.applications.grails.ocelli.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'applications', 'error')} ">
	<label for="applications">
		<g:message code="profile.applications.label" default="Applications" />
		
	</label>
	<g:select name="applications" from="${com.dreeling.applications.grails.ocelli.Application.list()}" multiple="multiple" optionKey="id" size="5" value="${profileInstance?.applications*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileDesc', 'error')} ">
	<label for="profileDesc">
		<g:message code="profile.profileDesc.label" default="Profile Desc" />
		
	</label>
	<g:textField name="profileDesc" value="${profileInstance?.profileDesc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileName', 'error')} ">
	<label for="profileName">
		<g:message code="profile.profileName.label" default="Profile Name" />
		
	</label>
	<g:textField name="profileName" value="${profileInstance?.profileName}"/>

</div>

