package com.dreeling.applications.grails.ocelli

import java.sql.Timestamp

class User {
	String user_id
	String email
	String password
	Date dateCreated
    Date lastUpdated
	AccessKey accessKey
    static hasMany = [profiles: Profile]
    static constraints = {
    }
}
