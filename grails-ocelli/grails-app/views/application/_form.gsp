<%@ page import="com.dreeling.applications.grails.ocelli.Application"%>

<section${hasErrors(bean: applicationInstance, field: 'appDescription', 'error')} ">
	<label class="label" for="appDescription"> <g:message
			code="application.appDescription.label" default="App Description" />

	</label> <label class="input"> <g:textField class="input-sm"
			name="appDescription" value="${applicationInstance?.appDescription}" />
	</label>
</section>

<section${hasErrors(bean: applicationInstance, field: 'appName', 'error')} ">
	<label class="label" for="appName"> <g:message
			code="application.appName.label" default="App Name" />

	</label> <label class="input"> <g:textField class="input-sm"
			name="appName" value="${applicationInstance?.appName}" /></label>
</section>

<section${hasErrors(bean: applicationInstance, field: 'artifacts', 'error')} ">

	<label class="label"><label for="artifacts"> <g:message
				code="application.artifacts.label" default="Artifacts" />

	</label> <label class="select select-multiple"></label> <g:select
			name="artifacts"
			from="${com.dreeling.applications.grails.ocelli.Artifact.list()}"
			multiple="multiple" optionKey="id" size="5"
			optionValue="artifactLocation"
			value="${applicationInstance?.artifacts*.id}" class="custom-scroll" />
	</label>
</section>

<div class="row"${hasErrors(bean: applicationInstance, field: 'environments', 'error')} ">
	<label for="environments"> <g:message
			code="application.environments.label" default="Environments" />

	</label>
	<g:select name="environments"
		from="${com.dreeling.applications.grails.ocelli.Environment.list()}"
		multiple="multiple" optionKey="id" size="5"
		optionValue="environmentDescription"
		value="${applicationInstance?.environments*.id}" class="many-to-many" />

</div>

