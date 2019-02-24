
import XCTest
import XCTest_Gherkin

class HabitsUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testHabitDisplay() {
        Given("I launch the app")
        And("I see habits displayed")
        When("I tap on the first cell")
        Then("The habit is displayed")
        When("I tap the back buttons")
        Then("I see habits displayed")
    }
    
    func testCreateNewHabit() {
        Given("I launch the app")
        And("I see habits displayed")
        When("I tap on the 'New Habit' navigation")
        And("I enter data for a new habit")
        Then("I see habits displayed")
        And("The new habit is displayed")
    }
    
    func testChangeCount() {
        Given("I launch the app")
        When("I tap on the first cell")
        Then("The habit is displayed")
        When("I tap the increase button")
        Then("The count is increased")
        When("I tap the decrease button")
        Then("The count is decreased")
    }
    
    func testEditSingleHabit() {
        Given("I am viewing a single habit")
        When("I tap the edit icon")
        Then("I am on the edit habit screen")
        And("There is a habit name placeholder")
        When("I update the habit name")
        Then("The edited habit is displayed")
    }

}
