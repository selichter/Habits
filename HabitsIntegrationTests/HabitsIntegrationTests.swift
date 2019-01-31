@testable import Habits
import XCTest


extension XCTestCase {
    func instantiateWithoutLoad<T>(fromStoryboard name: String, withIdentifier identifier: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        return viewController
    }
    
    func instantiateViewController<T>(fromStoryboard name: String, withIdentifier identifier: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        _ = (viewController as! UIViewController).view
        return viewController
    }
}

class HabitsCollectionIntegrationTests: XCTestCase {
    var habitsCollectionViewController: HabitsCollectionViewController!
    var dataSource = HabitDataSource()

    
    override func setUp() {
        super.setUp()
        habitsCollectionViewController = instantiateWithoutLoad(fromStoryboard: "Main", withIdentifier: "HabitsCollectionVC")
        
    }
    
    
    func testGameCellDisplayValues() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime")
        
        let entityTwo = HabitEntity(habitId: UUID().uuidString,
                                    name:"drink water",
                                    currentCount: 0,
                                    target: 0,
                                    timePeriod: "daily",
                                    measurement: "ounces",
                                    colorScheme: "deepPurple")
        dataSource.insert(item: entity)
        dataSource.insert(item: entityTwo)
        habitsCollectionViewController.loadView()
        habitsCollectionViewController.render(HabitsViewModel([entity, entityTwo]))
        
        let habitOne = habitsCollectionViewController.collectionView(habitsCollectionViewController.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! HabitCell

        XCTAssertEqual(habitOne.name.text, "EAT")
        XCTAssertEqual(habitOne.standings.text, "1/3")
        XCTAssertEqual(habitOne.timePeriod.text, "daily")
        XCTAssertEqual(habitOne.measurement.text, "meals")
        
        let habitTwo = habitsCollectionViewController.collectionView(habitsCollectionViewController.collectionView, cellForItemAt: IndexPath(row: 1, section: 0)) as! HabitCell
        
        XCTAssertEqual(habitTwo.name.text, "DRINK WATER")
        XCTAssertEqual(habitTwo.standings.text, "0/0")
        XCTAssertEqual(habitTwo.timePeriod.text, "daily")
        XCTAssertEqual(habitTwo.measurement.text, "ounces")
    }
    

}

