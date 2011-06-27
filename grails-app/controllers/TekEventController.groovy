

class TekEventController {
	
	def taskService
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekEventInstanceList: TekEvent.list( params ), tekEventInstanceTotal: TekEvent.count() ]
    }

    def show = {
        def tekEventInstance = TekEvent.get( params.id )

        if(!tekEventInstance) {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tekEventInstance : tekEventInstance ] }
    }

    def delete = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            try {
                tekEventInstance.delete(flush:true)
                flash.message = "TekEvent ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "TekEvent ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tekEventInstance = TekEvent.get( params.id )

        if(!tekEventInstance) {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tekEventInstance : tekEventInstance ]
        }
    }

    def update = {
        def tekEventInstance = TekEvent.get( params.id )
        if(tekEventInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tekEventInstance.version > version) {
                    
                    tekEventInstance.errors.rejectValue("version", "tekEvent.optimistic.locking.failure", "Another user has updated this TekEvent while you were editing.")
                    render(view:'edit',model:[tekEventInstance:tekEventInstance])
                    return
                }
            }
            tekEventInstance.properties = params
            if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
                flash.message = "TekEvent ${params.id} updated"
                redirect(action:show,id:tekEventInstance.id)
            }
            else {
                render(view:'edit',model:[tekEventInstance:tekEventInstance])
            }
        }
        else {
            flash.message = "TekEvent not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def tekEventInstance = new TekEvent()
        tekEventInstance.properties = params
        return ['tekEventInstance':tekEventInstance]
    }

    def save = {
        def tekEventInstance = new TekEvent(params)
        if(!tekEventInstance.hasErrors() && tekEventInstance.save()) {
            flash.message = "TekEvent ${tekEventInstance.id} created"
			taskService.addDefaultTasks(tekEventInstance)
            redirect(action:show,id:tekEventInstance.id)
        }
        else {
            render(view:'create',model:[tekEventInstance:tekEventInstance])
        }
    }
}
