@testable import Habits
import XCTest

class HabitIntegrationTests: XCTestCase {
    var habitViewController: HabitViewController!

    override func setUp() {
        super.setUp()
        habitViewController = instantiateWithoutLoad(fromStoryboard: "Main", withIdentifier: "HabitVC")
    }

    func testValuesAreDisplayed() {
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()

        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "1")
    }

    func testCurrentCountCanIncrease() {
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()
        habitViewController.increaseCount("something")

        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "1")
    }

    func testCurrentCountCanDecrease() {
        let hvm = HabitViewModel(habitEntity: entity)
        habitViewController.hvm = hvm
        habitViewController.viewDidLoad()
        habitViewController.decreaseCount("something")

        XCTAssertEqual(habitViewController.name.text, "EAT")
        XCTAssertEqual(habitViewController.currentCount.text, "0")
    }

}
