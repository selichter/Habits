import Foundation
import RealmSwift

struct CountEntity {
    var habitId: String
    var timestamp: Date
    var count: Int
}

class RealmCount: Object {
    @objc dynamic var habitId = ""
    @objc dynamic var timestamp = Date()
    @objc dynamic var count = 0

    convenience init(countEntity: CountEntity) {
        self.init()
        habitId = countEntity.habitId
        timestamp = countEntity.timestamp
        count = countEntity.count
    }

    var entity: CountEntity {
        return CountEntity(habitId: habitId,
                           timestamp: timestamp,
                           count: count
                        )
    }
}
