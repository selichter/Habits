import UIKit

class HabitViewController: UIViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var currentCount: UILabel!
    
    var habitEntity: HabitEntity?
    var dataSource = HabitDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let habit = self.habitEntity else {
            return
        }
        populateDisplay(habit)
    }
    
    @IBAction func increaseCount(_ sender: Any) {
        if var habit = habitEntity {
            print(habit.currentCount)
            
            habit.currentCount += 1
            try? HabitDataSource.sharedRealm.update(item: habit)
            
            habitEntity = habit
            currentCount.text = "\(habit.currentCount)"
            
        }
        self.viewDidLoad()
        
    }
    
    @IBAction func decreaseCount(_ sender: Any) {
        if var habit = habitEntity {
            print(habit.currentCount)
            habit.currentCount -= 1
            print(habit.currentCount)
            try? HabitDataSource.sharedRealm.update(item: habit)
            
            habitEntity = habit
            currentCount.text = "\(habit.currentCount)"
        }
        self.viewDidLoad()
    }
    
    func populateDisplay(_ habit: HabitEntity) {
        name.text = habit.name.uppercased()
        currentCount.text = "\(habit.currentCount)"
    }
    
}
