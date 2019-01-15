//
//  HabitTests.swift
//  HabitsTests
//
//  Created by Sarah Lichter on 12/24/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import XCTest
@testable import Habits


class HabitTests: XCTestCase {
    func testCreateRealmHabitFromHabitEntity() {
        let habitEntity = HabitEntity(habitId: UUID().uuidString,
                                      name:"drink water",
                                      currentCount: 0,
                                      target: 0,
                                      timePeriod: "daily",
                                      measurement: "ounces",
                                      colorScheme: "deepPurple")
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
