@testable import Habits
import XCTest

class HabitIntegrationTests: XCTestCase {
    var habitViewController: HabitViewController!
    
    override func setUp() {
        super.setUp()
        habitViewController = instantiateWithoutLoad(fromStoryboard: "Main", withIdentifier: "HabitVC")
    }
    
    func testValuesAreDisplayed() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime", counts: [Count]())
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()

        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "1")
    }
    
    func testCurrentCountCanIncrease() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime", counts: [Count]())
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()
        habitViewController.increaseCount("something")
        
        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "2")
    }
    
    func testCurrentCountCanDecrease() {
        let entity = HabitEntity(habitId: "test-habit", name: "eat", currentCount: 1, target: 3, timePeriod: "daily", measurement: "meals", colorScheme: "lime", counts: [Count]())
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()
        habitViewController.decreaseCount("something")
        
        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "0")
    }
    
}

