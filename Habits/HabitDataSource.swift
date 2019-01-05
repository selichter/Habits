//
//  HabitDataSource.swift
//  Habits
//
//  Created by Sarah Lichter on 12/23/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import Foundation
import RealmSwift

class HabitDataSource: DataSource {
    let realm = try! Realm()
    static let sharedRealm = HabitDataSource()

    func getAll() -> [HabitEntity] {
        return realm.objects(RealmHabit.self).map { $0.entity }
    }

    func getById(id: String) -> HabitEntity {
        return realm.objects(RealmHabit.self).filter("name == %@", id).first!.entity
    }

    func insert(item: HabitEntity) {
        try! realm.write {
            realm.add(RealmHabit(habit: item))
        }
    }

    func update(item: HabitEntity) throws {
        throw NSError()
    }

    func clean() {
        try! realm.write {
            realm.delete(realm.objects(RealmHabit.self))
        }
    }

    func deleteById(id: String) {}
}
