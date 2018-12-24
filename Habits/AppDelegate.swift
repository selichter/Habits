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
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
        })
        Realm.Configuration.defaultConfiguration = config
    }

    fileprivate func populateHabits() {
        let habitDataSource = HabitDataSource()
        let habit1 = HabitEntity(name: "workout")
        let habit2 = HabitEntity(name: "drink water")
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
