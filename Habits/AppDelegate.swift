import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate func migrateRealm() {
        let config = Realm.Configuration(
            schemaVersion: 6,
            deleteRealmIfMigrationNeeded: true
        )
        Realm.Configuration.defaultConfiguration = config
    }

    fileprivate func populateHabits() {
        let habitId = UUID().uuidString
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let yesterdayIncrease = CountEntity(habitId: habitId, timestamp: yesterday!, count: CountEnum.increase.rawValue)

        let habitDataSource = HabitDataSource()
        let habit1 = HabitEntity(habitId: habitId,
                                name: "workout",
                                 target: 3,
                                 timePeriod: "weekly",
                                 measurement: "hours")
        habitDataSource.insert(item: habit1)
        habitDataSource.insertCount(item: yesterdayIncrease)
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
