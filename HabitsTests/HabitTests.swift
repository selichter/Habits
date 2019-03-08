
import XCTest
@testable import Habits


class HabitTests: XCTestCase {
    func testCreateRealmHabitFromHabitEntity() {
        let habitEntity = HabitEntity(habitId: UUID().uuidString,
                                      name:"drink water",
                                      currentCount: 0,
                                      target: 0,
                                      timePeriod: "daily",
                                      measurement: "ounces")
        let realmHabit = RealmHabit(habit: habitEntity)
        XCTAssertEqual(habitEntity.name, realmHabit.name)
    }
    
    func testCreateHabitEntityFromRealmHabit() {
        let realmHabit = RealmHabit()
        realmHabit.name = "exercise"
        let habitEntity = realmHabit.entity
        XCTAssertEqual(habitEntity.name, realmHabit.name)
    }
    
}
