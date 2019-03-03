
import XCTest
@testable import Habits


class HabitTests: XCTestCase {
    func testCreateRealmHabitFromHabitEntity() {
        let habitEntity = HabitEntity(habitId: UUID().uuidString,
                                      name:"drink water",
                                      target: 0,
                                      timePeriod: "daily",
                                      measurement: "ounces",
                                      colorScheme: "deepPurple",
                                      counts: [Count]())
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
