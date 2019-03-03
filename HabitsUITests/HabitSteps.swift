import XCTest
import XCTest_Gherkin

class HabitsStepDefinitions: StepDefiner {
    let app = XCUIApplication()

    func launchApp() {
        self.app.launch()
    }
    
    override func defineSteps() {
        step("I launch the app") {
            self.launchApp()
        }
        
        step("I see habits displayed") {
            let firstCell = self.app.collectionViews.cells.element(boundBy: 0)
            
            XCTAssertEqual(firstCell.staticTexts["habitTitle"].label, "WORKOUT")
            XCTAssertEqual(firstCell.staticTexts["habitValues"].label, "0/3")
            XCTAssertEqual(firstCell.staticTexts["currentCount"].label, "0")
            XCTAssertEqual(firstCell.staticTexts["timePeriod"].label, "weekly")
        }
        
        step("I tap on the first cell") {
            let cell = self.app.collectionViews.cells.element(boundBy: 0)
            XCTAssertEqual(cell.staticTexts["habitValues"].label, "0/3")

            cell.tap()
        }
        
        step("The habit is displayed") {
            sleep(5)
            let habitName = self.app.staticTexts["habitName"].label
            let currentCount = self.app.staticTexts["currentCount"].label
            
            XCTAssertEqual(habitName, "WORKOUT")
            XCTAssertEqual(currentCount, "0")
        }
        
        step("I tap the increase button") {
            self.app.buttons["increaseCount"].tap()
        }
        
        step("The count is increased"){
            let currentCount = self.app.staticTexts["currentCount"].label
            XCTAssertEqual(currentCount, "1")
        }
        
        step("I tap the decrease button") {
            self.app.buttons["decreaseCount"].tap()
        }
        
        step("The count is decreased"){
            let currentCount = self.app.staticTexts["currentCount"].label
            XCTAssertEqual(currentCount, "0")
        }
        
        step("I tap the back button") {
            self.app.navigationBars.buttons["Back"].tap()
        }
        
        step("I enter data for a new habit") {
            enterText("Test Habit Name", inTextField: "newHabitName")
            enterText("1", inTextField: "targetInput")
            enterText("Test Measurement", inTextField: "measurementInput")
            self.app.buttons["daily"].tap()
            self.app.buttons["lime"].tap()
            XCTAssert(self.app.buttons["CreateHabit"].waitForExistence(timeout: 3))

            self.app.buttons["CreateHabit"].tap()
        }

        step("The new habit is displayed") {
            sleep(5)
            let lastCell = self.app.collectionViews.cells.element(boundBy: 1)

            XCTAssertEqual(lastCell.staticTexts["habitTitle"].label, "TEST HABIT NAME")
            XCTAssertEqual(lastCell.staticTexts["habitValues"].label, "0/1")
            XCTAssertEqual(lastCell.staticTexts["currentCount"].label, "0")
            XCTAssertEqual(lastCell.staticTexts["timePeriod"].label, "daily")
        }
        
        step("I am viewing a single habit") {
            self.step("I launch the app")
            self.step("I tap on the first cell")
            self.step("The habit is displayed")
        }
        
        step("I tap the edit icon") {
            self.app.buttons["Edit"].tap()
        }
        
        step("I am on the edit habit screen") {
            XCTAssert(self.app.buttons["Update Habit"].waitForExistence(timeout: 10))
        }

        step("There is a habit name placeholder") {
            let existingPlaceholder = self.app.textFields["newHabitName"].value as! String
            XCTAssertEqual(existingPlaceholder, "WORKOUT")

        }

        step("I update the habit name") {
            enterText("edit", inTextField: "newHabitName")


            self.app.buttons["monthly"].tap()
            self.app.buttons["Update Habit"].tap()
        }

        step("The edited habit is displayed") {
            sleep(4)
            let habitName = self.app.staticTexts["habitName"].label
            XCTAssertEqual(habitName, "WORKOUTEDIT")
        }

        func enterText(_ text: String, inTextField name: String) {
            let enterButton = "\n"
            
            textField(name).tap()
            textField(name).typeText(text)
            textField(name).typeText(enterButton)
        }
        
        func textField(_ name: String) -> XCUIElement {
            return XCUIApplication().textFields[name]
        }

    }
}
