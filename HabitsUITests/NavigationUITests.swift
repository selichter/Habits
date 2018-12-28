import XCTest
import XCTest_Gherkin
class NavigationUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    func testTabBarNav() {
        Given("I launch the app")
        When("I tap on the 'New Habit' tab")
        Then("I am on the new habit view")
        When("I tap on the 'Habits' tab")
        Then("I am on the habits view")
    }
}
