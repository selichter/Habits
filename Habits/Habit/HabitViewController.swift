import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    
    var hvm: HabitViewModel!
    
    override func viewDidLoad() {
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
    
}
