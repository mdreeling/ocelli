package ocelli.grails

class AccessKey {
	int accessKeyId
	String accessType
	String accessKey
	String accessValue
	String accessPacket
	static hasMany = [hosts: Host]
    static constraints = {
    }
}
