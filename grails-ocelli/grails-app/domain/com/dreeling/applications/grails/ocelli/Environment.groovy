package com.dreeling.applications.grails.ocelli

class Environment {
	String environmentName
	String environmentDescription
	static hasOne = [envType:EnvironmentType]
	static hasMany = [nodes: Node]
    static constraints = {
    }
}
