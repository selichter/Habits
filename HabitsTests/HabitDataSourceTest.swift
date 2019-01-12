import XCTest
import RealmSwift
@testable import Habits

class HabitDataSourceTest: XCTestCase {
    let realm = try! Realm()
    let habitDataSource = HabitDataSource()
    let habitOneId = UUID().uuidString
    let habitOneName = "drink water"

    

    override func setUp() {
        super.setUp()

        habitDataSource.clean()
        let habit1 = HabitEntity(habitId: habitOneId, name: habitOneName, currentCount: 0, target: 2, timePeriod: "daily", measurement: "ounces")
        let habit2 = HabitEntity(habitId: UUID().uuidString, name: "exercise", currentCount: 0, target: 2, timePeriod: "weekly", measurement: "hours")

        try! realm.write {
            realm.add(RealmHabit(habit: habit1))
            realm.add(RealmHabit(habit: habit2))
        }
    }

    override func tearDown() {
        habitDataSource.clean()

        super.tearDown()
    }

    func testGetAllReturnsAllHabitsFromRealm() {
        let habits = habitDataSource.getAll()

        XCTAssertEqual(2, habits.count)
    }

    func testGetByIdReturnsHabitByItsId() {
        
        let habit = habitDataSource.getById(id: self.habitOneId)

        XCTAssertEqual(habit.name, self.habitOneName)
        XCTAssertEqual(habit.habitId, self.habitOneId)

    }

    func testInsertPutsHabitIntoRealm() {
        let id = UUID().uuidString
        let habit3 = HabitEntity(habitId: id, name: "sleep", currentCount: 0, target: 2, timePeriod: "daily", measurement: "ounces")

        habitDataSource.insert(item: habit3)
        let fetchedHabit = habitDataSource.getById(id: habit3.habitId)

        XCTAssertEqual(fetchedHabit.name, habit3.name)
    }

    func testInserteHabitUpdatesGivenHabit() {
        let habitId = UUID().uuidString
        var habit = HabitEntity(habitId: habitId, name: "something", currentCount: 0, target: 2, timePeriod: "daily", measurement: "ounces")
        habitDataSource.insert(item: habit)

        habit.currentCount = 3
        habitDataSource.insert(item: habit)
        let afterUpdate = habitDataSource.getById(id: habitId)
        XCTAssertEqual(afterUpdate.currentCount, 3)
        XCTAssertEqual(afterUpdate.name, habit.name)
        XCTAssertEqual(afterUpdate.habitId, habit.habitId)

    }

    func testCleanRemovesAllHabitss() {
        habitDataSource.clean()
        let habits = habitDataSource.getAll()

        XCTAssertEqual(0, habits.count)
    }

}
