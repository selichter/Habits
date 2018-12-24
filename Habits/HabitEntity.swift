import Foundation
import RealmSwift

struct HabitEntity {
    let name: String
}

class RealmHabit: Object {
    @objc dynamic var name = ""
//    @objc dynamic var currentCount = 0
//    @objc dynamic var target = 0

    convenience init(habit: HabitEntity) {
        self.init()
        name = habit.name
    }

    var entity: HabitEntity {
        return HabitEntity(name: name)
    }
}
