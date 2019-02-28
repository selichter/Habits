import Foundation
import RealmSwift

class CountDataSource: DataSource {
    let realm = try! Realm()
    static let sharedRealm = CountDataSource()

    func getAll() -> [CountEntity] {
        return realm.objects(RealmCount.self).map { $0.entity }
    }

    func getAllById(id: String) -> [CountEntity] {
        return realm.objects(RealmCount.self).filter("habitId == %@", id).map { $0.entity}

    }

    func getById(id: String) -> CountEntity {
        return realm.objects(RealmCount.self).filter("habitId == %@", id).first!.entity

    }

    func insert(item: CountEntity) {
        try! realm.write {
            realm.add(RealmCount(countEntity: item))
        }
    }

    func clean() {
        try! realm.write {
            realm.delete(realm.objects(RealmCount.self))
        }
    }

    func deleteById(id: String) {}
}
