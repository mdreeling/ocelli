<%@ page import="ocelli.grails.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profiles', 'error')} ">
	<label for="profiles">
		<g:message code="user.profiles.label" default="Profiles" />
		
	</label>
	<g:select name="profiles" from="${ocelli.grails.Profile.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.profiles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${userInstance?.username}"/>

</div>

