import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    @IBOutlet weak var currentStreak: UILabel!
    @IBOutlet weak var yesterdayCount: UILabel!

    var hvm: HabitViewModel!
    override func viewDidLoad() {
        view.backgroundColor = spearmint
        populateDisplay(hvm)
    }

    override func viewDidAppear(_ animated: Bool) {
        let thisHvm = HabitDataSource().getById(habitId: hvm.habitId)
        hvm = HabitViewModel(habitEntity: thisHvm)
        populateDisplay(hvm)
    }

    @IBAction func increaseCount(_ sender: Any) {
        hvm.increaseCount()
        populateDisplay(hvm)
    }

    @IBAction func decreaseCount(_ sender: Any) {
        hvm.decreaseCount()
        populateDisplay(hvm)
    }

    @IBAction func resetCurrentCount(_ sender: Any) {
        hvm.resetCount()
        populateDisplay(hvm)
    }

    func populateDisplay(_ habit: HabitViewModel) {
        name.text = habit.name
        currentCount.text = "\(habit.todayCount)"
        yesterdayCount.text = "\(habit.yesterdayCount)"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editHabit" {
            if let viewController = segue.destination as? EditHabitViewController {
                viewController.hvm = hvm
            }
        }
    }
}
