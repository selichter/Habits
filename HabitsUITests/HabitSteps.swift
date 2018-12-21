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
        
        step("I see a habit") {
            let water = "Daily Water"
            let values = "60/80"
            let timeLeft = "12 hours left"
            
            XCTAssertEqual(self.app.staticTexts["habitTitle"].label, water)
            XCTAssertEqual(self.app.staticTexts["habitValues"].label, values)
            XCTAssertEqual(self.app.staticTexts["time"].label, timeLeft)
        }
      
    }
}
