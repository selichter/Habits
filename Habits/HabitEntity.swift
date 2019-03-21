import Foundation
import RealmSwift

enum CountEnum: String {
    case increase, decrease
}

struct CountEntity {
    var habitId: String
    var timestamp: Date
    var count: String
}

struct HabitEntity {
    var habitId: String
    var name: String
    var target: Int
    var timePeriod: String
    var measurement: String
}

class RealmCount: Object {
    @objc dynamic var habitId = ""
    @objc dynamic var timestamp = Date()
    @objc dynamic var count = ""

    convenience init(countEntity: CountEntity) {
        self.init()
        habitId = countEntity.habitId
        timestamp = countEntity.timestamp
        count = countEntity.count
    }

    var entity: CountEntity {
        return CountEntity(habitId: habitId, timestamp: timestamp, count: count)
    }
}

class RealmHabit: Object {
    @objc dynamic var habitId = ""
    @objc dynamic var name = ""
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
        target = habit.target
        timePeriod = habit.timePeriod
        measurement = habit.measurement
    }

    var entity: HabitEntity {
        return HabitEntity(habitId: habitId,
                           name: name,
                           target: target,
                           timePeriod: timePeriod,
                           measurement: measurement
        )
    }
}
