import Foundation
import RealmSwift

class HabitDataSource: DataSource {
    let realm = try! Realm()
    static let sharedRealm = HabitDataSource()

    func getAll() -> [HabitEntity] {
        return realm.objects(RealmHabit.self).map { $0.entity }
    }

    func getAllCounts() -> [CountEntity] {
        return realm.objects(RealmCount.self).map { $0.entity }
    }

    func getById(habitId: String) -> HabitEntity {
        return realm.objects(RealmHabit.self).filter("habitId == %@", habitId).first!.entity
    }

    func getCountsByHabitId(habitId: String) -> [CountEntity] {
        return realm.objects(RealmCount.self).filter("habitId == %@", habitId).map { $0.entity }
    }

    func insert(item: HabitEntity) {
        do {
            try? realm.write {
                realm.add(RealmHabit(habit: item), update: true)
            }
        }
    }

    func insertCount(item: CountEntity) {
        do {
            try? realm.write {
                realm.add(RealmCount(countEntity: item))
            }
        }
    }

    func clean() {
        do {
            try? realm.write {
                realm.delete(realm.objects(RealmHabit.self))
                realm.delete(realm.objects(RealmCount.self))
            }
        }
    }

    func deleteCountsByHabitId(habitId: String) {
        do {
            try? realm.write {
                realm.delete(realm.objects(RealmCount.self).filter("habitId == %@", habitId))
            }
        }
    }

    func deleteById(habitId: String) {}
}
