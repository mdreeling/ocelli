package com.dreeling.applications.grails.ocelli

class Profile {
	String profileDesc
	String profileName
	static hasMany = [applications: Application]
    static constraints = {
    }
}
