package com.dreeling.applications.grails.ocelli

class EnvironmentType {
	String environmentType
	String environmentTypeDescription
	static hasMany = [environments: Environment]
    static constraints = {
    }
}
