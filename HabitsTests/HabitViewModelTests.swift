import Foundation

import XCTest
@testable import Habits

class HabitViewModelTests: XCTestCase {
    var dataSource = HabitDataSource()

    override func setUp() {
        dataSource.clean()
    }

    func testPropertiesAreSet() {
        let hvm = HabitViewModel(habitEntity: eat)
        XCTAssertEqual(hvm.name, eat.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 0)
        XCTAssertEqual(hvm.measurement, eat.measurement)
        XCTAssertEqual(hvm.target, eat.target)
    }

    func testIncreaseCount() {
        let hvm = HabitViewModel(habitEntity: eat)
        XCTAssertEqual(hvm.currentCount, 0)

        hvm.increaseCount()

        XCTAssertEqual(hvm.name, eat.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 1)
    }

    func testDecreaseCount() {
        dataSource.insertCount(item: eatCount)

        let hvm = HabitViewModel(habitEntity: eat)
        XCTAssertEqual(hvm.currentCount, 1)

        hvm.decreaseCount()

        XCTAssertEqual(hvm.name, eat.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 0)
    }

    func testdecreaseCountDoesNotDecreaseBelow0() {
        let hvm = HabitViewModel(habitEntity: eat)
        hvm.decreaseCount()

        XCTAssertEqual(hvm.name, eat.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 0)
    }

    func testCurrentCountRepresentsTheNetOfTodaysCounts() {
        dataSource.insertCount(item: eatCount)
        dataSource.insertCount(item: eatCountDecrease)
        dataSource.insertCount(item: eatCountYesterdayDecrease)

        let hvm = HabitViewModel(habitEntity: eat)
        hvm.decreaseCount()

        XCTAssertEqual(hvm.name, eat.name.uppercased())
        XCTAssertEqual(hvm.currentCount, 0)
    }

}
