class Message {
	
	static belongsTo = TekEvent
	
	String subject
	String content
	Message parent
	TekEvent event
	TekUser author

    static constraints = {
		subject(blank:false)
		content(blank:false, maxSize:2000)
		parent(nullable:true)
		author(nullable:false)
    }
}
