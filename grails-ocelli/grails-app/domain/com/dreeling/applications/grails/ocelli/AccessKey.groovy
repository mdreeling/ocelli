package com.dreeling.applications.grails.ocelli

class AccessKey {
	String data
	String principal
	static hasOne = [accessKeyType:AccessKeyType]
	static hasMany = [nodes: Node]
    static constraints = {
    }
	static mapping = {
		myTextField type: 'text'
	 }
}
