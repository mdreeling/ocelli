package com.dreeling.applications.grails.ocelli

class Application {
	String appName
	String appDescription
	static hasMany = [environments:Environment,artifacts:Artifact]
    static constraints = {
    }
}
