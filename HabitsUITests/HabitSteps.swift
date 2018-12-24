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
            let cells = self.app.collectionViews.cells
            XCTAssert(cells.staticTexts["drink water"].waitForExistence(timeout: 2))
            XCTAssert(cells.staticTexts["workout"].waitForExistence(timeout: 2))
            
            XCTAssertEqual(cells.count, 2)
        }
      
    }
}
