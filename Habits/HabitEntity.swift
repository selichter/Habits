import Foundation
import RealmSwift

enum CountEnum {
    case increase, decrease
}

struct Count {
    var timestamp: Date
    var count: CountEnum
}

struct HabitEntity {
    var habitId: String
    let name: String
    var currentCount: Int
    let target: Int
    let timePeriod: String
    let measurement: String
    let colorScheme: String
    var counts = [Count]()
}

class RealmHabit: Object {
    @objc dynamic var habitId = ""
    @objc dynamic var name = ""
    @objc dynamic var currentCount = 0
    @objc dynamic var target = 0
    @objc dynamic var timePeriod = ""
    @objc dynamic var measurement = ""
    @objc dynamic var colorScheme = "cyan"
    var counts = [Count]()

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
        colorScheme = habit.colorScheme
        counts = habit.counts
        
    }

    var entity: HabitEntity {
        return HabitEntity(habitId: habitId,
                           name: name,
                           currentCount: currentCount,
                           target: target,
                           timePeriod: timePeriod,
                           measurement: measurement,
                           colorScheme: colorScheme,
                           counts: counts
        )
    }
}
