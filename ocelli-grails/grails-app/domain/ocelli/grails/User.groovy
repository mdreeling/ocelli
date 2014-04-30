package ocelli.grails

class User {
	String username
	static hasMany = [profiles: Profile]
    static constraints = {
    }
}
