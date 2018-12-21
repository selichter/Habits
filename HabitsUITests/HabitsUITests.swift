//
//  HabitsUITests.swift
//  HabitsUITests
//
//  Created by Sarah Lichter on 12/19/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import XCTest
import XCTest_Gherkin
class HabitsUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testHabitDisplay() {
        Given("I launch the app")
        Then("I see a habit")

    }

}
