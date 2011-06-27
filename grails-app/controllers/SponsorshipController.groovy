

class SponsorshipController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sponsorshipInstanceList: Sponsorship.list( params ), sponsorshipInstanceTotal: Sponsorship.count() ]
    }

    def show = {
        def sponsorshipInstance = Sponsorship.get( params.id )

        if(!sponsorshipInstance) {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ sponsorshipInstance : sponsorshipInstance ] }
    }

    def delete = {
        def sponsorshipInstance = Sponsorship.get( params.id )
        if(sponsorshipInstance) {
            try {
                sponsorshipInstance.delete(flush:true)
                flash.message = "Sponsorship ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Sponsorship ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def sponsorshipInstance = Sponsorship.get( params.id )

        if(!sponsorshipInstance) {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ sponsorshipInstance : sponsorshipInstance ]
        }
    }

    def update = {
        def sponsorshipInstance = Sponsorship.get( params.id )
        if(sponsorshipInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(sponsorshipInstance.version > version) {
                    
                    sponsorshipInstance.errors.rejectValue("version", "sponsorship.optimistic.locking.failure", "Another user has updated this Sponsorship while you were editing.")
                    render(view:'edit',model:[sponsorshipInstance:sponsorshipInstance])
                    return
                }
            }
            sponsorshipInstance.properties = params
            if(!sponsorshipInstance.hasErrors() && sponsorshipInstance.save()) {
                flash.message = "Sponsorship ${params.id} updated"
                redirect(action:show,id:sponsorshipInstance.id)
            }
            else {
                render(view:'edit',model:[sponsorshipInstance:sponsorshipInstance])
            }
        }
        else {
            flash.message = "Sponsorship not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def sponsorshipInstance = new Sponsorship()
        sponsorshipInstance.properties = params
        return ['sponsorshipInstance':sponsorshipInstance]
    }

    def save = {
        def sponsorshipInstance = new Sponsorship(params)
        if(!sponsorshipInstance.hasErrors() && sponsorshipInstance.save()) {
            flash.message = "Sponsorship ${sponsorshipInstance.id} created"
            redirect(action:show,id:sponsorshipInstance.id)
        }
        else {
            render(view:'create',model:[sponsorshipInstance:sponsorshipInstance])
        }
    }
}
