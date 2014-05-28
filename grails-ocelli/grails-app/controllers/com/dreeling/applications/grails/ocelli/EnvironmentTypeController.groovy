package com.dreeling.applications.grails.ocelli



import static org.springframework.http.HttpStatus.*

import com.dreeling.applications.grails.ocelli.EnvironmentType;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class EnvironmentTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EnvironmentType.list(params), model:[environmentTypeInstanceCount: EnvironmentType.count()]
    }

    def show(EnvironmentType environmentTypeInstance) {
        respond environmentTypeInstance
    }

    def create() {
        respond new EnvironmentType(params)
    }

    @Transactional
    def save(EnvironmentType environmentTypeInstance) {
        if (environmentTypeInstance == null) {
            notFound()
            return
        }

        if (environmentTypeInstance.hasErrors()) {
            respond environmentTypeInstance.errors, view:'create'
            return
        }

        environmentTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'environmentTypeInstance.label', default: 'EnvironmentType'), environmentTypeInstance.id])
                redirect environmentTypeInstance
            }
            '*' { respond environmentTypeInstance, [status: CREATED] }
        }
    }

    def edit(EnvironmentType environmentTypeInstance) {
        respond environmentTypeInstance
    }

    @Transactional
    def update(EnvironmentType environmentTypeInstance) {
        if (environmentTypeInstance == null) {
            notFound()
            return
        }

        if (environmentTypeInstance.hasErrors()) {
            respond environmentTypeInstance.errors, view:'edit'
            return
        }

        environmentTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EnvironmentType.label', default: 'EnvironmentType'), environmentTypeInstance.id])
                redirect environmentTypeInstance
            }
            '*'{ respond environmentTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EnvironmentType environmentTypeInstance) {

        if (environmentTypeInstance == null) {
            notFound()
            return
        }

        environmentTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EnvironmentType.label', default: 'EnvironmentType'), environmentTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'environmentTypeInstance.label', default: 'EnvironmentType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
