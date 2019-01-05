import XCTest
import XCTest_Gherkin

class NavigationStepDefinitions: StepDefiner {
    let app = XCUIApplication()
    
    func launchApp() {
        self.app.launch()
    }
    
    override func defineSteps() {
        step("I launch the app") {
            self.launchApp()
        }
        
        step("I tap on the '(.*)' navigation") { (match: String) in
//            self.app.tabBars.buttons[match].tap()
            self.app.navigationBars.buttons["+"].tap()
        }
        
        step("I am on the new habit view") {
            XCTAssert(self.app.textFields["newHabitName"].waitForExistence(timeout: 2))
        }
        
        step("I tap on the back navigation") {
            self.app.navigationBars.buttons["Back"].tap()
        }
        
        step("I am on the habits view") {
            let firstCell = self.app.collectionViews.cells.element(boundBy: 0)
            
            XCTAssertEqual(firstCell.staticTexts["habitTitle"].label, "workout")
            XCTAssertEqual(firstCell.staticTexts["habitValues"].label, "1/3")

        }
    }
}
