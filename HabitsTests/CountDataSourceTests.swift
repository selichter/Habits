import XCTest
import RealmSwift
@testable import Habits

class CountDataSourceTest: XCTestCase {
    let realm = try! Realm()
    let countDataSource = CountDataSource()
    let habitDataSource = HabitDataSource()

    let habitOneId = UUID().uuidString
    let habitOneName = "drink water"

    override func setUp() {
        super.setUp()

        countDataSource.clean()

        let habit1 = HabitEntity(habitId: habitOneId, name: habitOneName, currentCount: 0, target: 2, timePeriod: "daily", measurement: "ounces", colorScheme: "green")
        let count1 = CountEntity(habitId: habitOneId, timestamp: Date(), count: 1)
        let count2 = CountEntity(habitId: "second-habit-id", timestamp: Date(), count: 1)
        let count3 = CountEntity(habitId: habitOneId, timestamp: Date(), count: 1)

        try! realm.write {
            realm.add(RealmHabit(habit: habit1))
            realm.add(RealmCount(countEntity: count1))
            realm.add(RealmCount(countEntity: count2))
            realm.add(RealmCount(countEntity: count3))
        }
    }

    override func tearDown() {
        countDataSource.clean()

        super.tearDown()
    }

    func testGetAllReturnsAllCountsFromRealm() {
        let counts = countDataSource.getAll()

        XCTAssertEqual(3, counts.count)
    }

    func testGetByIdReturnsAllCountsForAHabitId() {
        let counts = countDataSource.getAllById(id: habitOneId)

        XCTAssertEqual(counts.count, 2)
        XCTAssertEqual(counts[0].habitId, self.habitOneId)

    }

    func testInsertPutsCountIntoRealm() {
        let id = UUID().uuidString
        let count4 = CountEntity(habitId: id, timestamp: Date(), count: 1)

        countDataSource.insert(item: count4)
        let fetchedCount = countDataSource.getAllById(id: id)

        XCTAssertEqual(fetchedCount.count, 1)
        XCTAssertEqual(fetchedCount[0].habitId, count4.habitId)
    }


    func testCleanRemovesAllCounts() {
        countDataSource.clean()
        let counts = countDataSource.getAll()

        XCTAssertEqual(0, counts.count)
    }

}
