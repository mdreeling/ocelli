package ocelli.grails



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Host.list(params), model:[hostInstanceCount: Host.count()]
    }

    def show(Host hostInstance) {
        respond hostInstance
    }

    def create() {
        respond new Host(params)
    }

    @Transactional
    def save(Host hostInstance) {
        if (hostInstance == null) {
            notFound()
            return
        }

        if (hostInstance.hasErrors()) {
            respond hostInstance.errors, view:'create'
            return
        }

        hostInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hostInstance.label', default: 'Host'), hostInstance.id])
                redirect hostInstance
            }
            '*' { respond hostInstance, [status: CREATED] }
        }
    }

    def edit(Host hostInstance) {
        respond hostInstance
    }

    @Transactional
    def update(Host hostInstance) {
        if (hostInstance == null) {
            notFound()
            return
        }

        if (hostInstance.hasErrors()) {
            respond hostInstance.errors, view:'edit'
            return
        }

        hostInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Host.label', default: 'Host'), hostInstance.id])
                redirect hostInstance
            }
            '*'{ respond hostInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Host hostInstance) {

        if (hostInstance == null) {
            notFound()
            return
        }

        hostInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Host.label', default: 'Host'), hostInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hostInstance.label', default: 'Host'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
