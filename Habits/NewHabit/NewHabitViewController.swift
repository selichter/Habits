import UIKit

class NewHabitViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var habitFormView: HabitForm!
    
    @IBOutlet weak var timePeriodStackView: UIStackView!
    @IBOutlet weak var colorChoicesStackView: UIStackView!

    var timePeriodValue = String()
    var colorChoice = String()

    
    @IBAction func createHabit(_ sender: Any) {
        let newHabit = HabitEntity(habitId: UUID().uuidString,
                name: habitFormView.xibHabitNameInput.text ?? "",
                                   currentCount: 0,
                                   target: Int(habitFormView.xibTargetInput.text!) ?? 0,
                                   timePeriod: timePeriodValue,
                                   measurement: habitFormView.xibMeasurementInput.text ?? "",
                                   colorScheme: colorChoice, counts: []
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
        
        for choice in timePeriodChoices {
            let button = makeButtonsWithText(choice)
            button.addTarget(self, action: #selector(selectButtonValue), for: .touchUpInside)
            timePeriodStackView.addArrangedSubview(button)
        }

        for choice in Array(allColors.keys) {
            let button = makeColorButtons(choice)
            button.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
            colorChoicesStackView.addArrangedSubview(button)
        }
    }
    
    @IBAction func selectButtonValue(sender:UIButton){
        unhighlightAllButtons(timePeriodStackView)
        highlightSelectedButton(sender)
        timePeriodValue = sender.titleLabel!.text ?? "daily"
    }

    @IBAction func selectColor(sender:UIButton){
        unhighlightAllButtons(colorChoicesStackView)
        highlightSelectedButton(sender)
        colorChoice = sender.accessibilityIdentifier ?? "cyan"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
