package ocelli.grails



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AccessKeyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AccessKey.list(params), model:[accessKeyInstanceCount: AccessKey.count()]
    }

    def show(AccessKey accessKeyInstance) {
        respond accessKeyInstance
    }

    def create() {
        respond new AccessKey(params)
    }

    @Transactional
    def save(AccessKey accessKeyInstance) {
        if (accessKeyInstance == null) {
            notFound()
            return
        }

        if (accessKeyInstance.hasErrors()) {
            respond accessKeyInstance.errors, view:'create'
            return
        }

        accessKeyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'accessKeyInstance.label', default: 'AccessKey'), accessKeyInstance.id])
                redirect accessKeyInstance
            }
            '*' { respond accessKeyInstance, [status: CREATED] }
        }
    }

    def edit(AccessKey accessKeyInstance) {
        respond accessKeyInstance
    }

    @Transactional
    def update(AccessKey accessKeyInstance) {
        if (accessKeyInstance == null) {
            notFound()
            return
        }

        if (accessKeyInstance.hasErrors()) {
            respond accessKeyInstance.errors, view:'edit'
            return
        }

        accessKeyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AccessKey.label', default: 'AccessKey'), accessKeyInstance.id])
                redirect accessKeyInstance
            }
            '*'{ respond accessKeyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AccessKey accessKeyInstance) {

        if (accessKeyInstance == null) {
            notFound()
            return
        }

        accessKeyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AccessKey.label', default: 'AccessKey'), accessKeyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessKeyInstance.label', default: 'AccessKey'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
