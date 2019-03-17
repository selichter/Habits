import XCTest
import RealmSwift
@testable import Habits

class HabitDataSourceTest: XCTestCase {
    let realm = try! Realm()
    let habitDataSource = HabitDataSource()

    override func setUp() {
        super.setUp()

        habitDataSource.clean()

        try! realm.write {
            realm.add(RealmHabit(habit: drinkWater))
            realm.add(RealmHabit(habit: exercise))

            realm.add(RealmCount(countEntity: count1))
            realm.add(RealmCount(countEntity: count2))
            realm.add(RealmCount(countEntity: count3))
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

    func testGetAllCountsReturnsAllCountsFromRealm() {
        let counts = habitDataSource.getAllCounts()
        XCTAssertEqual(3, counts.count)
    }

    func testGetByIdReturnsHabitByItsId() {
        habitDataSource.clean()

        try! realm.write {
            realm.add(RealmHabit(habit: drinkWater))
        }
        let habit = habitDataSource.getById(id: drinkWaterId)

        XCTAssertEqual(habit.name, habitOneName)
        XCTAssertEqual(habit.habitId, drinkWaterId)
    }

    func testGetCountsByIdReturnsAllCountsForGivenHabit() {
        let counts = habitDataSource.getCountsByHabitId(id: drinkWaterId)

        XCTAssertEqual(counts.count, 2)
        XCTAssertEqual(counts[0].habitId, drinkWaterId)
        XCTAssertEqual(counts[1].habitId, drinkWaterId)
    }

    func testInsertPutsHabitIntoRealm() {
        let id = UUID().uuidString
        let habit3 = HabitEntity(habitId: id, name: "sleep",  target: 2, timePeriod: "daily", measurement: "ounces")

        habitDataSource.insert(item: habit3)
        let fetchedHabit = habitDataSource.getById(id: habit3.habitId)

        XCTAssertEqual(fetchedHabit.name, habit3.name)
    }

    func testInsertCountPutsCountIntoRealm() {
        habitDataSource.insertCount(item: count3)
        let fetchedCount = habitDataSource.getCountsByHabitId(id: drinkWaterId)[1]

        XCTAssertEqual(fetchedCount.habitId, count3.habitId)
        XCTAssertEqual(fetchedCount.count, "decrease")
    }

    func testInsertCountCanInsertMultipleCountsWithSameHabitId() {
        habitDataSource.insertCount(item: count1)
        habitDataSource.insertCount(item: count3)

        var fetchedCounts = habitDataSource.getCountsByHabitId(id: drinkWaterId)

        XCTAssertEqual(fetchedCounts[0].habitId, count1.habitId)
        XCTAssertEqual(fetchedCounts[1].habitId, count3.habitId)
    }

    func testInserteHabitUpdatesGivenHabit() {
        let habitId = UUID().uuidString
        var habit = HabitEntity(habitId: habitId, name: "something",  target: 2, timePeriod: "daily", measurement: "ounces")
        habitDataSource.insert(item: habit)

        habit.timePeriod = "weekly"
        habitDataSource.insert(item: habit)
        let afterUpdate = habitDataSource.getById(id: habitId)

        XCTAssertEqual(afterUpdate.name, habit.name)
        XCTAssertEqual(afterUpdate.habitId, habit.habitId)
        XCTAssertEqual(afterUpdate.timePeriod, habit.timePeriod)
    }

    func testCleanRemovesAllHabitsAndCounts() {
        habitDataSource.clean()
        let habits = habitDataSource.getAll()
        let counts = habitDataSource.getAllCounts()
        XCTAssertEqual(0, habits.count)
        XCTAssertEqual(0, counts.count)
    }

}
