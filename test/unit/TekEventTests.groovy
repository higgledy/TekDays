import grails.test.*

class TekEventTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testToString() {
		def tekEvent = new TekEvent( 	city: 'San Francisco, CA',
	 								 	name: 'Groovy One',
		 								organizer: [fullName:'John Doe'] as TekUser,
		 								venue: 'Moscone Center',
	 									startDate: new Date('6/2/2009'),
		 								endDate: new Date('6/9/2009'),
										description: 'This conference will cover all ....')
		assertEquals 'Groovy One, San Francisco, CA', tekEvent.toString()
    }
}
