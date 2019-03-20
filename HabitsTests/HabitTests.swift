
import XCTest
@testable import Habits


class HabitTests: XCTestCase {
    func testCreateRealmCountFromCountEntity() {
        let entity = CountEntity(habitId: "habitId", timestamp: Date(), count: CountEnum.increase.rawValue)

        let realmCount = RealmCount(countEntity: entity)
        XCTAssertEqual(entity.timestamp, realmCount.timestamp)
    }

    func testCreateCountEntityFromRealmCount() {
        let entity = CountEntity(habitId: "habitId", timestamp: Date(), count: CountEnum.increase.rawValue)
        let realmCount = RealmCount(countEntity: entity)

        XCTAssertEqual(realmCount.timestamp, realmCount.entity.timestamp)
    }

    func testCreateRealmHabitFromHabitEntity() {
        let habitEntity = HabitEntity(habitId: UUID().uuidString,
                                      name:"drink water",
                                      target: 0,
                                      timePeriod: "daily",
                                      measurement: "ounces")
        let realmHabit = RealmHabit(habit: habitEntity)
        XCTAssertEqual(habitEntity.name, realmHabit.name)
    }

    func testCreateHabitEntityFromRealmHabit() {
        let thisDate = Date()
        let realmHabit = RealmHabit()
        realmHabit.name = "exercise"
        let habitEntity = realmHabit.entity
        XCTAssertEqual(habitEntity.name, realmHabit.name)
    }

}
