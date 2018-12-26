import Foundation
import RealmSwift

struct HabitEntity {
    let name: String
    var currentCount: Int
    let target: Int
    let timePeriod: String
    let measurement: String
}

class RealmHabit: Object {
    @objc dynamic var name = ""
    @objc dynamic var currentCount = 0
    @objc dynamic var target = 0
    @objc dynamic var timePeriod = ""
    @objc dynamic var measurement = ""

    convenience init(habit: HabitEntity) {
        self.init()
        name = habit.name
        currentCount = habit.currentCount
        target = habit.target
        timePeriod = habit.timePeriod
        measurement = habit.measurement
    }

    var entity: HabitEntity {
        return HabitEntity(name: name,
                           currentCount: currentCount,
                           target: target,
                           timePeriod: timePeriod,
                           measurement: measurement)
    }
}
