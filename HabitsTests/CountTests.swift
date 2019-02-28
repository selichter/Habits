import XCTest
@testable import Habits


class CountTests: XCTestCase {
    func testCreateRealmCountFromCountEntity() {
        let countEntity = CountEntity(habitId: UUID().uuidString,
                                      timestamp: Date(),
                                      count: 1)
        let realmCount = RealmCount(countEntity: countEntity)
        XCTAssertEqual(countEntity.habitId, realmCount.habitId)
        XCTAssertEqual(countEntity.timestamp, realmCount.timestamp)
        XCTAssertEqual(countEntity.count, realmCount.count)


    }

    func testCreateCountEntityFromRealmCount() {
        let realmCount = RealmCount()
        realmCount.habitId = "habit-id-here"
        let countEntity = realmCount.entity
        XCTAssertEqual(countEntity.habitId, realmCount.habitId)
    }

}
