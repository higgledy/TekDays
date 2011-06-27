

class TekUserController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tekUserInstanceList: TekUser.list( params ), tekUserInstanceTotal: TekUser.count() ]
    }

    def show = {
        def tekUserInstance = TekUser.get( params.id )

        if(!tekUserInstance) {
            flash.message = "TekUser not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tekUserInstance : tekUserInstance ] }
    }

    def delete = {
        def tekUserInstance = TekUser.get( params.id )
        if(tekUserInstance) {
            try {
                tekUserInstance.delete(flush:true)
                flash.message = "TekUser ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "TekUser ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "TekUser not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def tekUserInstance = TekUser.get( params.id )

        if(!tekUserInstance) {
            flash.message = "TekUser not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tekUserInstance : tekUserInstance ]
        }
    }

    def update = {
        def tekUserInstance = TekUser.get( params.id )
        if(tekUserInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tekUserInstance.version > version) {
                    
                    tekUserInstance.errors.rejectValue("version", "tekUser.optimistic.locking.failure", "Another user has updated this TekUser while you were editing.")
                    render(view:'edit',model:[tekUserInstance:tekUserInstance])
                    return
                }
            }
            tekUserInstance.properties = params
            if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
                flash.message = "TekUser ${params.id} updated"
                redirect(action:show,id:tekUserInstance.id)
            }
            else {
                render(view:'edit',model:[tekUserInstance:tekUserInstance])
            }
        }
        else {
            flash.message = "TekUser not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def tekUserInstance = new TekUser()
        tekUserInstance.properties = params
        return ['tekUserInstance':tekUserInstance]
    }

    def save = {
        def tekUserInstance = new TekUser(params)
        if(!tekUserInstance.hasErrors() && tekUserInstance.save()) {
            flash.message = "TekUser ${tekUserInstance.id} created"
            redirect(action:show,id:tekUserInstance.id)
        }
        else {
            render(view:'create',model:[tekUserInstance:tekUserInstance])
        }
    }
}
