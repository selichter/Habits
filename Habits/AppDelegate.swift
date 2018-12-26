//
//  AppDelegate.swift
//  Habits
//
//  Created by Sarah Lichter on 12/19/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate func migrateRealm() {
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    // The enumerateObjects(ofType:_:) method iterates
                    // over every Person object stored in the Realm file
                    migration.enumerateObjects(ofType: RealmHabit.className()) { _, newObject in
                        newObject!["currentCount"] = 0
                        newObject!["target"] = 0
                    }
                }
        })
        Realm.Configuration.defaultConfiguration = config
    }

    fileprivate func populateHabits() {
        let habitDataSource = HabitDataSource()
        let habit1 = HabitEntity(name: "workout",
                                 currentCount: 1,
                                 target: 3,
                                 timePeriod: "weekly",
                                 measurement: "hours")
        let habit2 = HabitEntity(name: "drink water",
                                 currentCount: 0,
                                 target: 2,
                                 timePeriod: "daily",
                                 measurement: "ounces")
        habitDataSource.insert(item: habit1)
        habitDataSource.insert(item: habit2)
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        migrateRealm()
        let habitDataSource = HabitDataSource()
        let habits = habitDataSource.getAll()
        if habits.count == 0 {
            populateHabits()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
