import Foundation

import XCTest
@testable import Habits

class HabitsViewModelTests: XCTestCase {
    var dataSource = HabitDataSource()
    
    func testHabitsAreSet() {
        let habitsVM = HabitsViewModel([eat, drinkWater])
        
        XCTAssertEqual(habitsVM.habits.count, 2)
        XCTAssertEqual(habitsVM.habits[0].name, "EAT")
        XCTAssertEqual(habitsVM.habits[0].standings, "0/3")
        
        XCTAssertEqual(habitsVM.habits[1].name, "DRINK WATER")
        XCTAssertEqual(habitsVM.habits[1].standings, "0/2")
        
        dataSource.clean()
    }
}
