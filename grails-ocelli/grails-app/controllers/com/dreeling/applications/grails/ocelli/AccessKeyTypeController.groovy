package com.dreeling.applications.grails.ocelli



import static org.springframework.http.HttpStatus.*

import com.dreeling.applications.grails.ocelli.AccessKeyType;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AccessKeyTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AccessKeyType.list(params), model:[accessKeyTypeInstanceCount: AccessKeyType.count()]
    }

    def show(AccessKeyType accessKeyTypeInstance) {
        respond accessKeyTypeInstance
    }

    def create() {
        respond new AccessKeyType(params)
    }

    @Transactional
    def save(AccessKeyType accessKeyTypeInstance) {
        if (accessKeyTypeInstance == null) {
            notFound()
            return
        }

        if (accessKeyTypeInstance.hasErrors()) {
            respond accessKeyTypeInstance.errors, view:'create'
            return
        }

        accessKeyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'accessKeyTypeInstance.label', default: 'AccessKeyType'), accessKeyTypeInstance.id])
                redirect accessKeyTypeInstance
            }
            '*' { respond accessKeyTypeInstance, [status: CREATED] }
        }
    }

    def edit(AccessKeyType accessKeyTypeInstance) {
        respond accessKeyTypeInstance
    }

    @Transactional
    def update(AccessKeyType accessKeyTypeInstance) {
        if (accessKeyTypeInstance == null) {
            notFound()
            return
        }

        if (accessKeyTypeInstance.hasErrors()) {
            respond accessKeyTypeInstance.errors, view:'edit'
            return
        }

        accessKeyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AccessKeyType.label', default: 'AccessKeyType'), accessKeyTypeInstance.id])
                redirect accessKeyTypeInstance
            }
            '*'{ respond accessKeyTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AccessKeyType accessKeyTypeInstance) {

        if (accessKeyTypeInstance == null) {
            notFound()
            return
        }

        accessKeyTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AccessKeyType.label', default: 'AccessKeyType'), accessKeyTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'accessKeyTypeInstance.label', default: 'AccessKeyType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
