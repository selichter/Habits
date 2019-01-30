import Foundation

import XCTest
@testable import Habits

class HabitsViewModelTests: XCTestCase {
    var dataSource = HabitDataSource()
    
    func testHabitsAreSet() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let entityTwo = HabitEntity(habitId: UUID().uuidString,
                                      name:"drink water",
                                      currentCount: 0,
                                      target: 0,
                                      timePeriod: "daily",
                                      measurement: "ounces",
                                      colorScheme: "deepPurple")
        
        
        let habitsVM = HabitsViewModel([entity, entityTwo])
        
        XCTAssertEqual(habitsVM.habits.count, 2)
        XCTAssertEqual(habitsVM.habits[0].name, "EAT")
        XCTAssertEqual(habitsVM.habits[0].standings, "1/3")
        
        XCTAssertEqual(habitsVM.habits[1].name, "DRINK WATER")
        XCTAssertEqual(habitsVM.habits[1].standings, "0/0")
        
        dataSource.clean()
    }
}
