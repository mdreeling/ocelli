<%@ page import="com.dreeling.applications.grails.ocelli.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accessKey', 'error')} required">
	<label for="accessKey">
		<g:message code="user.accessKey.label" default="Access Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="accessKey" name="accessKey.id" from="${com.dreeling.applications.grails.ocelli.AccessKey.list()}" optionKey="id" required="" value="${userInstance?.accessKey?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profiles', 'error')} ">
	<label for="profiles">
		<g:message code="user.profiles.label" default="Profiles" />
		
	</label>
	<g:select name="profiles" from="${com.dreeling.applications.grails.ocelli.Profile.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.profiles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'user_id', 'error')} ">
	<label for="user_id">
		<g:message code="user.user_id.label" default="Userid" />
		
	</label>
	<g:textField name="user_id" value="${userInstance?.user_id}"/>

</div>

