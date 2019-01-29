import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    
    var habit: HabitEntity!
    var hvm: HabitViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hvm = HabitViewModel(habitEntity: habit)
        print("hvm in vc")
        print(hvm.currentCount)
        view.backgroundColor = allColors[hvm.colorScheme]!.primary
        populateDisplay(hvm)
    }
    
    @IBAction func increaseCount(_ sender: Any) {
        hvm.increaseCount()
        populateDisplay(hvm)
    }
    
    @IBAction func decreaseCount(_ sender: Any) {
        hvm.decreaseCount()
        habit = hvm.thisHabitEntity
        self.viewDidLoad()
    }
    
    func populateDisplay(_ habit: HabitViewModel) {
        name.text = habit.name.uppercased()
        name.textColor = allColors[habit.colorScheme]!.secondary
        currentCount.text = "\(habit.currentCount)"
        currentCount.textColor = allColors[habit.colorScheme]!.secondary
    }
    
}
