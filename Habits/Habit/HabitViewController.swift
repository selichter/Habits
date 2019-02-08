import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    
    var hvm: HabitViewModel!
    
    override func viewDidLoad() {
        view.backgroundColor = allColors[hvm.colorScheme]!.primary
        populateDisplay(hvm)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let thisHvm = HabitDataSource().getById(id: hvm.habitId)
        hvm = HabitViewModel(habitEntity: thisHvm)
        view.backgroundColor = allColors[hvm.colorScheme]!.primary
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
    
    func populateDisplay(_ habit: HabitViewModel) {
        name.text = habit.name
        name.textColor = allColors[habit.colorScheme]!.secondary
        currentCount.text = "\(habit.currentCount)"
        currentCount.textColor = allColors[habit.colorScheme]!.secondary
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editHabit" {
            let viewController = segue.destination as! EditHabitViewController
            viewController.hvm = hvm
        }
    }
    
}
