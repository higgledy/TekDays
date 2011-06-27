class Sponsor {
	static hasMany = [sponsorships: Sponsorship]
	
	String name
	String website
	String description
	byte[] logo

    static constraints = {
		name(blank:false)
		website(blank:false)
		description(nullable:true, maxSize:5000)
		logo(nullable:true, maxSize:1000000)
		sponsorships(nullable:true)
    }

	String toString() {
		name
	}
}
