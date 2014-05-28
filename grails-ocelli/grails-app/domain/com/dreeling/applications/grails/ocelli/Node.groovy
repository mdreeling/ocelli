package com.dreeling.applications.grails.ocelli

class Node {
	String nodeName
	String nodeDescription
	String nodeHostName
	static hasOne = [accessKey:AccessKey]
	static hasMany = [artifacts:Artifact]
	static constraints = {
	}
}
