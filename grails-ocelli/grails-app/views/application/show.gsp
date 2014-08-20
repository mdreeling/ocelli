
<%@ page import="com.dreeling.applications.grails.ocelli.Application"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'application.label', default: 'Application')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div
		class="jarviswidget jarviswidget-color-blueDark jarviswidget-sortable">
		<div role="content">
			<div id="show-application" class="table-responsive" role="main">
				<h1>
					<b> ${applicationInstance?.appName}
					</b>
				</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>

				<g:if test="${applicationInstance?.appDescription}">

					<span class="property-value" aria-labelledby="appDescription-label"><g:fieldValue
							bean="${applicationInstance}" field="appDescription" /></span>

				</g:if>


				<h2>
					<g:message code="application.artifacts.label" default="Artifacts" />
				</h2>
				<g:if test="${applicationInstance?.artifacts}">

					<div class="table-responsive">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Artifiact Location</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${applicationInstance.artifacts}" var="a">
									<tr class="even">

										<td><span class="property-value"
											aria-labelledby="artifacts-label"><g:link
													controller="artifact" action="show" id="${a.id}">
													${a.artifactLocation?.encodeAsHTML()}
												</g:link></span> <b>on 40 nodes<b> <g:actionSubmit class="delete" action="update"
							value="Start Streaming"
							onclick="return confirm('Are you sure you wish to begin Streaming to Elastic Search?');" /></td>

									</tr>

								</g:each>

							</tbody>
						</table>

					</div>
				</g:if>

				<g:if test="${applicationInstance?.environments}">

					<div class="table-responsive">

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Available Environments</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${applicationInstance.environments}" var="e">
									<tr class="even">

										<td><span class="property-value"
											aria-labelledby="environments-label"><g:link
													controller="environment" action="show" id="${e.id}">
													${e.environmentName?.encodeAsHTML()}
												</g:link></span></td>

									</tr>

								</g:each>

							</tbody>
						</table>

					</div>
				</g:if>

				<g:form url="[resource:applicationInstance, action:'delete']"
					method="DELETE">
					<fieldset class="buttons">
						<a href="#application/edit/${applicationInstance.id}">Edit</a>
						<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						<a href="#application/create">New</a>
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
