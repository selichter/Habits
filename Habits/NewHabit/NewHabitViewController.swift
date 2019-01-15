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
    @IBOutlet weak var habitNameTextField: UITextField!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var measurementTextField: UITextField!
    
    @IBOutlet weak var timePeriodStackView: UIStackView!

    
    var timePeriodValue = String()
    
    @IBAction func createHabit(_ sender: Any) {
        let newHabit = HabitEntity(habitId: UUID().uuidString,
                name: habitNameTextField.text ?? "",
                                   currentCount: 0,
                                   target: Int(targetTextField.text!) ?? 0,
                                   timePeriod: timePeriodValue,
                                   measurement: measurementTextField.text ?? ""
                                   )
        HabitDataSource.sharedRealm.insert(item: newHabit)
        print("saved realm")
        performSegueToReturnBack()
    }
    
    var timePeriodChoices: [String] {
        return TimePeriod.allCases.map({$0.rawValue})
    }
    
    override func viewDidLoad() {
        habitNameTextField.delegate = self
        targetTextField.delegate = self
        measurementTextField.delegate = self
        for choice in timePeriodChoices {
            timePeriodStackView.addArrangedSubview(makeButtonsWithText(choice))
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func makeButtonsWithText(_ text: String)-> UIButton {
        let timePeriodButton = UIButton(type: UIButton.ButtonType.system)
        let width = timePeriodButton.intrinsicContentSize.width
        timePeriodButton.frame = CGRect(x: 20, y: 20, width: width, height: 100)
        timePeriodButton.setTitle(text, for: .normal)
        timePeriodButton.setTitleColor(UIColor.black, for: .normal)
        timePeriodButton.layer.cornerRadius = 10
        timePeriodButton.sizeToFit()
        timePeriodButton.addTarget(self, action: #selector(selectButtonValue), for: .touchUpInside)
        
        return timePeriodButton
    }
    
    @IBAction func selectButtonValue(sender:UIButton){
        for button in timePeriodStackView.subviews {
            if button is UIButton {
                button.backgroundColor = UIColor.white
            }
        }
        sender.backgroundColor = UIColor.lightGray
        timePeriodValue = sender.titleLabel!.text ?? "daily"
    }
    
    
}
