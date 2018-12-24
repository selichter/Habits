//
//  HabitDataSourceTest.swift
//  HabitsTests
//
//  Created by Sarah Lichter on 12/23/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Habits

class HabitDataSourceTest: XCTestCase {
    let realm = try! Realm()
    let habitDataSource = HabitDataSource()

    override func setUp() {
        super.setUp()

        habitDataSource.clean()

        let habit1 = HabitEntity(name: "drink water")
        let habit2 = HabitEntity(name: "exercise")

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

    func testGetByIdReturnsHabitByItsName() {
        let habitName = "drink water"

        let habit = habitDataSource.getById(id: habitName)

        XCTAssertEqual(habit.name, habitName)
    }

    func testInsertPutsHabitIntoRealm() {
        let habit3 = HabitEntity(name: "sleep")

        habitDataSource.insert(item: habit3)
        let fetchedHabit = habitDataSource.getById(id: habit3.name)

        XCTAssertEqual(fetchedHabit.name, habit3.name)
    }

    func testUpdateHabitUpdatesGivenHabit() {
        let habit = HabitEntity(name: "something")
        habitDataSource.insert(item: habit)

        XCTAssertThrowsError(try habitDataSource.update(item: habit))
    }

    func testCleanRemovesAllHabitss() {
        habitDataSource.clean()
        let habits = habitDataSource.getAll()

        XCTAssertEqual(0, habits.count)
    }

}
