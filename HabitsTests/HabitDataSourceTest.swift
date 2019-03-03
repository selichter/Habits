import XCTest
import RealmSwift
@testable import Habits

class HabitDataSourceTest: XCTestCase {
    let realm = try! Realm()
    let habitDataSource = HabitDataSource()
    let habitOneId = UUID().uuidString
    let habitTwoId = UUID().uuidString
    let habitOneName = "drink water"

    override func setUp() {
        super.setUp()

        habitDataSource.clean()
        let count1 = Count(timestamp: Date(), count: CountEnum.increase)
        let count2 = Count(timestamp: Date(), count: CountEnum.increase)
        let count3 = Count(timestamp: Date(), count: CountEnum.decrease)

        let habit1 = HabitEntity(habitId: habitOneId, name: habitOneName,  target: 2, timePeriod: "daily", measurement: "ounces", colorScheme: "green", counts: [count1])
        let habit2 = HabitEntity(habitId: habitTwoId , name: "exercise",  target: 2, timePeriod: "weekly", measurement: "hours", colorScheme: "indigo", counts: [count2, count3])

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
        let habit3 = HabitEntity(habitId: id, name: "sleep",  target: 2, timePeriod: "daily", measurement: "ounces", colorScheme: "red", counts: [Count]())

        habitDataSource.insert(item: habit3)
        let fetchedHabit = habitDataSource.getById(id: habit3.habitId)

        XCTAssertEqual(fetchedHabit.name, habit3.name)
    }

    func testInserteHabitUpdatesGivenHabit() {
        let habitId = UUID().uuidString
        var habit = HabitEntity(habitId: habitId, name: "something",  target: 2, timePeriod: "daily", measurement: "ounces", colorScheme: "purple", counts: [Count]())
        habitDataSource.insert(item: habit)

//        habit.currentCount = 3
        habitDataSource.insert(item: habit)
        let afterUpdate = habitDataSource.getById(id: habitId)
//        XCTAssertEqual(afterUpdate.currentCount, 3)
        XCTAssertEqual(afterUpdate.name, habit.name)
        XCTAssertEqual(afterUpdate.habitId, habit.habitId)

    }

    func testCleanRemovesAllHabits() {
        habitDataSource.clean()
        let habits = habitDataSource.getAll()

        XCTAssertEqual(0, habits.count)
    }

}
