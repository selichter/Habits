import Foundation
import RealmSwift

struct HabitEntity {
    var habitId: String
    let name: String
    var currentCount: Int
    let target: Int
    let timePeriod: String
    let measurement: String
}

class RealmHabit: Object {
    @objc dynamic var habitId = ""
    @objc dynamic var name = ""
    @objc dynamic var currentCount = 0
    @objc dynamic var target = 0
    @objc dynamic var timePeriod = ""
    @objc dynamic var measurement = ""
    
    override static func primaryKey() -> String? {
        return "habitId"
    }

    convenience init(habit: HabitEntity) {
        self.init()
        habitId = habit.habitId
        name = habit.name
        currentCount = habit.currentCount
        target = habit.target
        timePeriod = habit.timePeriod
        measurement = habit.measurement
    }

    var entity: HabitEntity {
        return HabitEntity(habitId: habitId,
                           name: name,
                           currentCount: currentCount,
                           target: target,
                           timePeriod: timePeriod,
                           measurement: measurement)
    }
}
