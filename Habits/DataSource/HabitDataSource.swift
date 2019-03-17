
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

    func getById(id: String) -> HabitEntity {
        return realm.objects(RealmHabit.self).filter("habitId == %@", id).first!.entity
    }

    func getCountsByHabitId(id: String) -> [CountEntity] {
        return realm.objects(RealmCount.self).filter("habitId == %@", id).map { $0.entity }
    }

    func insert(item: HabitEntity) {
        try! realm.write {
            realm.add(RealmHabit(habit: item), update: true)
        }
    }

    func insertCount(item: CountEntity) {
        try! realm.write {
            realm.add(RealmCount(countEntity: item))
        }
    }

    func clean() {
        try! realm.write {
            realm.delete(realm.objects(RealmHabit.self))
            realm.delete(realm.objects(RealmCount.self))
        }
    }

    func deleteById(id: String) {}
}
