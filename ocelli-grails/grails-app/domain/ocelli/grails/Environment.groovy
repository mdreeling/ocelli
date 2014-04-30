package ocelli.grails

class Environment {
	String envCode
	String envDescription
	static hasMany = [hosts: Host]
    static constraints = {
    }
}
