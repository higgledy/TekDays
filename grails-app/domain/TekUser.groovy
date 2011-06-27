class TekUser {
	
	String fullName
	String userName
	String password
	String email
	String website
	String bio

    static constraints = {
		fullName()
		userName()
		//password()
		email()
		website()
		bio(maxSize:5000)
    }

	String toString() {
		fullName
	}
}
