import Foundation
@testable import Habits

let testHabitId = "test-habit"
let entity = HabitEntity(habitId: testHabitId,
                         name: "eat",
                         target: 3,
                         timePeriod: "daily",
                         measurement: "meals")

let testHabitCount = CountEntity(habitId: testHabitId,
                                 timestamp: Date(),
                                 count: CountEnum.increase.rawValue)


let entityTwo = HabitEntity(habitId: UUID().uuidString,
                            name:"drink water",
                            target: 0,
                            timePeriod: "daily",
                            measurement: "ounces")
