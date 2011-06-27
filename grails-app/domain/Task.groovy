class Task {
	
	static belongsTo = TekEvent
	
	String title
	String notes
	TekUser assignTo
	Date dueDate
	TekEvent event
	Boolean completed

    static constraints = {
		title(blank:false)
		notes(blank:true, nullable:true, maxSize:5000)
		assignTo(nullable:true)
		dueDate(nullable:true)
		completed(nullable:true)
/*		event*/
    }

	String toString() {
		title
	}
}
