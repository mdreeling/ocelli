package com.dreeling.applications.grails.ocelli

class ArtifactType {
	String artifactTypeName
	String artifactTypeDescription
	static hasMany = [artifacts: Artifact]
    static constraints = {
    }
}
