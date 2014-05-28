package com.dreeling.applications.grails.ocelli

class AccessKeyType {
	String accessKeyTypeName
	String accessKeyTypeDescription
	static hasMany = [accessKeys: AccessKey]
    static constraints = {
    }
}
