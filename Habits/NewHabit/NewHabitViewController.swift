import UIKit

class NewHabitViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var habitFormView: HabitForm!
    @IBOutlet weak var timePeriodStackView: UIStackView!
    var timePeriodValue = String()

    @IBAction func createHabit(_ sender: Any) {
        let newHabit = HabitEntity(habitId: UUID().uuidString,
                name: habitFormView.xibHabitNameInput.text ?? "",
                                   target: Int(habitFormView.xibTargetInput.text!) ?? 0,
                                   timePeriod: timePeriodValue,
                                   measurement: habitFormView.xibMeasurementInput.text ?? ""
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
    }

    @IBAction func selectButtonValue(sender: UIButton) {
        unhighlightAllButtons(timePeriodStackView)
        highlightSelectedButton(sender)
        timePeriodValue = sender.titleLabel!.text ?? "daily"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
