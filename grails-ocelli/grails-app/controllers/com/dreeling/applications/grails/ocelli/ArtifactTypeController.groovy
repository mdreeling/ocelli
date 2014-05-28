package com.dreeling.applications.grails.ocelli



import static org.springframework.http.HttpStatus.*

import com.dreeling.applications.grails.ocelli.ArtifactType;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArtifactTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ArtifactType.list(params), model:[artifactTypeInstanceCount: ArtifactType.count()]
    }

    def show(ArtifactType artifactTypeInstance) {
        respond artifactTypeInstance
    }

    def create() {
        respond new ArtifactType(params)
    }

    @Transactional
    def save(ArtifactType artifactTypeInstance) {
        if (artifactTypeInstance == null) {
            notFound()
            return
        }

        if (artifactTypeInstance.hasErrors()) {
            respond artifactTypeInstance.errors, view:'create'
            return
        }

        artifactTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'artifactTypeInstance.label', default: 'ArtifactType'), artifactTypeInstance.id])
                redirect artifactTypeInstance
            }
            '*' { respond artifactTypeInstance, [status: CREATED] }
        }
    }

    def edit(ArtifactType artifactTypeInstance) {
        respond artifactTypeInstance
    }

    @Transactional
    def update(ArtifactType artifactTypeInstance) {
        if (artifactTypeInstance == null) {
            notFound()
            return
        }

        if (artifactTypeInstance.hasErrors()) {
            respond artifactTypeInstance.errors, view:'edit'
            return
        }

        artifactTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ArtifactType.label', default: 'ArtifactType'), artifactTypeInstance.id])
                redirect artifactTypeInstance
            }
            '*'{ respond artifactTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ArtifactType artifactTypeInstance) {

        if (artifactTypeInstance == null) {
            notFound()
            return
        }

        artifactTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ArtifactType.label', default: 'ArtifactType'), artifactTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'artifactTypeInstance.label', default: 'ArtifactType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
