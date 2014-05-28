package com.dreeling.applications.grails.ocelli

class Artifact {
	String artifactLocation
	static hasOne = [artifactType:ArtifactType]
    static constraints = {
    }
}
