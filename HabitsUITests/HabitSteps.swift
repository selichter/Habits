//
//  HabitSteps.swift
//  HabitsUITests
//
//  Created by Sarah Lichter on 12/20/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

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
            
            XCTAssertEqual(firstCell.staticTexts["habitTitle"].label, "workout")
            XCTAssertEqual(firstCell.staticTexts["habitValues"].label, "1/3")
            XCTAssertEqual(firstCell.staticTexts["measurement"].label, "hours")
            XCTAssertEqual(firstCell.staticTexts["timePeriod"].label, "weekly")

            let secondCell = self.app.collectionViews.cells.element(boundBy: 1)
            
            XCTAssertEqual(secondCell.staticTexts["habitTitle"].label, "drink water")
            XCTAssertEqual(secondCell.staticTexts["habitValues"].label, "0/2")
            XCTAssertEqual(secondCell.staticTexts["measurement"].label, "ounces")
            XCTAssertEqual(secondCell.staticTexts["timePeriod"].label, "daily")
            
        }
        
        step("I tap on the first cell") {
            let cell = self.app.collectionViews.cells.element(boundBy: 0)
            XCTAssertEqual(cell.staticTexts["habitValues"].label, "1/3")

            cell.tap()
        }
        
        step("The count is increased"){
            let cell = self.app.collectionViews.cells.element(boundBy: 0)
            XCTAssertEqual(cell.staticTexts["habitValues"].label, "2/3")
        }
        
        step("I enter data for a new habit") {
            enterText("Test Habit Name", inTextField: "newHabitName")
            enterText("1", inTextField: "targetInput")
            enterText("Test Measurement", inTextField: "measurementInput")
            enterText("Test Time Period", inTextField: "timePeriodInput")
            
            self.app.buttons["Create Habit"].tap()
        }
        
        step("The new habit is displayed") {
            let cellCount = self.app.collectionViews.cells.count
            let lastCellIndex = cellCount - 1
            let lastCell = self.app.collectionViews.cells.element(boundBy: lastCellIndex)

            XCTAssertEqual(lastCell.staticTexts["habitTitle"].label, "Test Habit Name")
            XCTAssertEqual(lastCell.staticTexts["habitValues"].label, "0/1")
            XCTAssertEqual(lastCell.staticTexts["measurement"].label, "Test Measurement")
            XCTAssertEqual(lastCell.staticTexts["timePeriod"].label, "Test Time Period")
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
