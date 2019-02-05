import UIKit

extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


class NewHabitViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var habitFormView: HabitForm!
    
    @IBAction func createHabit(_ sender: Any) {
        let newHabit = HabitEntity(habitId: UUID().uuidString,
                name: habitFormView.xibHabitNameInput.text ?? "",
                                   currentCount: 0,
                                   target: Int(habitFormView.xibTargetInput.text!) ?? 0,
                                   timePeriod: habitFormView.timePeriodValue,
                                   measurement: habitFormView.xibMeasurementInput.text ?? "", colorScheme: habitFormView.colorChoice
                                   )
        HabitDataSource.sharedRealm.insert(item: newHabit)
        print("saved realm")
        performSegueToReturnBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habitFormView.xibHabitNameInput.delegate = self
        habitFormView.xibTargetInput.delegate = self
        habitFormView.xibMeasurementInput.delegate = self
        
        habitFormView.xibHabitNameInput.placeholder = "HABIT NAME"
        habitFormView.xibTargetInput.placeholder = "4"
        habitFormView.xibMeasurementInput.placeholder = "DAILY"
    }
    
}
