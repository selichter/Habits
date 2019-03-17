import Foundation
@testable import Habits


let drinkWaterId = UUID().uuidString
let exerciseId = UUID().uuidString
let habitOneName = "drink water"

let count1 = CountEntity(habitId: drinkWaterId, timestamp: Date(), count: CountEnum.increase.rawValue)
let count2 = CountEntity(habitId: exerciseId, timestamp: Date(), count: CountEnum.increase.rawValue)
let count3 = CountEntity(habitId: drinkWaterId, timestamp: Date(), count: CountEnum.decrease.rawValue)

let drinkWater = HabitEntity(habitId: drinkWaterId, name: habitOneName,  target: 2, timePeriod: "daily", measurement: "ounces")
let exercise = HabitEntity(habitId: exerciseId , name: "exercise",  target: 2, timePeriod: "weekly", measurement: "hours")

let eatId = "test-habit"
let eat = HabitEntity(habitId: eatId,
                      name: "eat",
                      target: 3,
                      timePeriod: "daily",
                      measurement: "meals")
let eatCount = CountEntity(habitId: eatId, timestamp: Date(), count: CountEnum.increase.rawValue)

let eatCountDecrease = CountEntity(habitId: eatId, timestamp: Date(), count: CountEnum.decrease.rawValue)

let eatCountYesterdayDecrease = CountEntity(habitId: eatId, timestamp: yesterdayDate!, count: CountEnum.decrease.rawValue)

let cal = Calendar.current
let yesterday = cal.dateComponents([.day], from: cal.date(byAdding: .day, value: -1, to: Date())!)
let yesterdayDate = cal.date(from: yesterday)

