import Foundation

import XCTest
@testable import Habits

class HabitViewModelTests: XCTestCase {
    var dataSource = HabitDataSource()
    
    func testPropertiesAreSet() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let hvm = HabitViewModel(habitEntity: entity)
        XCTAssertEqual(hvm.colorScheme, entity.colorScheme)
        XCTAssertEqual(hvm.name, entity.name.uppercased())
        XCTAssertEqual(hvm.currentCount, entity.currentCount)
        XCTAssertEqual(hvm.measurement, entity.measurement)
        dataSource.clean()
    }
    
    func testIncreaseCount() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let hvm = HabitViewModel(habitEntity: entity)
        hvm.increaseCount()
        
        XCTAssertEqual(hvm.name, entity.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 2)
        XCTAssertEqual(hvm.thisHabitEntity.currentCount, 2)
        dataSource.clean()
    }
    
    func testDecreaseCount() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 2, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let hvm = HabitViewModel(habitEntity: entity)
        hvm.decreaseCount()
        
        XCTAssertEqual(hvm.name, entity.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 1)
        XCTAssertEqual(hvm.thisHabitEntity.currentCount, 1)
        dataSource.clean()

    }
    
    func testdecreaseCountDoesNotDecreaseBelow0() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 0, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let hvm = HabitViewModel(habitEntity: entity)
        hvm.decreaseCount()
        
        XCTAssertEqual(hvm.name, entity.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 0)
        XCTAssertEqual(hvm.thisHabitEntity.currentCount, 0)
        dataSource.clean()

    }
    
}
