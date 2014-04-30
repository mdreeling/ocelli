package ocelli.grails

class Host {
	String hostName
	static hasOne = [accessKey:AccessKey]
    static constraints = {
		accessKey nullable: true
    }
}
