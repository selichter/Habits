import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    
    var hvm: HabitViewModel!
    
    override func viewDidLoad() {
        view.backgroundColor = spearmint
        populateDisplay(hvm)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let thisHvm = HabitDataSource().getById(id: hvm.habitId)
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
    
    func populateDisplay(_ habit: HabitViewModel) {
        name.text = habit.name
        name.textColor = sunflower
        currentCount.text = "\(habit.currentCount)"
        currentCount.textColor = sunflower
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editHabit" {
            let viewController = segue.destination as! EditHabitViewController
            viewController.hvm = hvm
        }
    }
    
}
