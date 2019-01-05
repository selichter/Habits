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
        Then("I see habits displayed")
        Then("I tap on the first cell")
        And("The count is increased")
    }
    
    func testCreateNewHabit() {
        Given("I launch the app")
        And("I see habits displayed")
        When("I tap on the 'New Habit' navigation")
        And("I enter data for a new habit")
        Then("I see habits displayed")
        And("The new habit is displayed")
    }

}
