import UIKit

class EditHabitViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var habitForm: HabitForm!
    var hvm: HabitViewModel!

    @IBOutlet weak var timePeriodStackView: UIStackView!
    var timePeriodValue: String!

    @IBOutlet weak var colorChoicesStackView: UIStackView!
    var colorChoice: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        timePeriodValue = hvm.timePeriod

        for choice in timePeriodChoices {
            let button = makeButtonsWithText(choice)
            button.addTarget(self, action: #selector(selectButtonValue), for: .touchUpInside)
            timePeriodStackView.addArrangedSubview(button)
        }

        populateForm(hvm)
        highlightButtonMatchingChoice(timePeriodStackView, timePeriodValue)
    }

    func populateForm(_ habit: HabitViewModel) {
        habitForm.xibHabitNameInput.delegate = self
        habitForm.xibTargetInput.delegate = self
        habitForm.xibMeasurementInput.delegate = self

        habitForm.xibHabitNameInput.text = habit.name
        habitForm.xibTargetInput.text = "\(habit.target)"
        habitForm.xibMeasurementInput.text = habit.measurement
    }

    @IBAction func selectButtonValue(sender: UIButton) {
        unhighlightAllButtons(timePeriodStackView)
        highlightSelectedButton(sender)
        timePeriodValue = sender.titleLabel!.text ?? "daily"
    }

    @IBAction func updateHabit(_ sender: Any) {
        let entity = HabitEntity(habitId: hvm.habitId,
                                   name: habitForm.xibHabitNameInput.text ?? "",
                                   target: Int(habitForm.xibTargetInput.text!) ?? 0,
                                   timePeriod: timePeriodValue,
                                   measurement: habitForm.xibMeasurementInput.text ?? ""
        )

//        figure out how to not new up an entity here
        hvm = HabitViewModel(habitEntity: entity)
        hvm.persistHabit()
        performSegueToReturnBack()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
