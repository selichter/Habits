import XCTest
import XCTest_Gherkin
class NavigationUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testTabBarNav() {
        Given("I launch the app")
        When("I tap on the 'New Habit' navigation")
        Then("I am on the new habit view")
        When("I tap on the back navigation")
        Then("I am on the habits view")
    }
}
