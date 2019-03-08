import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate func migrateRealm() {
        let config = Realm.Configuration(
            schemaVersion: 6,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    // The enumerateObjects(ofType:_:) method iterates
                    // over every Person object stored in the Realm file
                    migration.enumerateObjects(ofType: RealmHabit.className()) { _, newObject in
                        newObject!["currentCount"] = 0
                        newObject!["target"] = 0
                    }
                }
        },
            deleteRealmIfMigrationNeeded: true

        )
        Realm.Configuration.defaultConfiguration = config
        
    }

    fileprivate func populateHabits() {
        let habitDataSource = HabitDataSource()
        let habit1 = HabitEntity(habitId: UUID().uuidString,
                                name: "workout",
                                 currentCount: 1,
                                 target: 3,
                                 timePeriod: "weekly",
                                 measurement: "hours")
        habitDataSource.insert(item: habit1)
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        migrateRealm()
        let habitDataSource = HabitDataSource()
        habitDataSource.clean()
        populateHabits()
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
