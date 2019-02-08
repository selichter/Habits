import UIKit

class EditHabitViewController: UIViewController {

    @IBOutlet weak var habitForm: HabitForm!
    var hvm: HabitViewModel!

    @IBOutlet weak var timePeriodStackView: UIStackView!
    var timePeriodValue: String!
    
    @IBOutlet weak var colorChoicesStackView: UIStackView!
    var colorChoice: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorChoice = hvm.colorScheme
        timePeriodValue = hvm.timePeriod
        
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

        populateForm(hvm)
        highlightButtonMatchingChoice(colorChoicesStackView, colorChoice)
        highlightButtonMatchingChoice(timePeriodStackView, timePeriodValue)
    }

    func populateForm(_ habit: HabitViewModel){
        habitForm.xibHabitNameInput.text = habit.name
        habitForm.xibTargetInput.text = "\(habit.target)"
        habitForm.xibMeasurementInput.text = habit.measurement
    }
    
    @IBAction func selectButtonValue(sender: UIButton) {
        unhighlightAllButtons(timePeriodStackView)
        highlightSelectedButton(sender)
        timePeriodValue = sender.titleLabel!.text ?? "daily"
    }
    
    @IBAction func selectColor(sender: UIButton) {
        unhighlightAllButtons(colorChoicesStackView)
        highlightSelectedButton(sender)
        colorChoice = sender.accessibilityIdentifier ?? "cyan"
    }

    @IBAction func updateHabit(_ sender: Any) {
        let entity = HabitEntity(habitId: hvm.habitId,
                                   name: habitForm.xibHabitNameInput.text ?? "",
                                   currentCount: hvm.currentCount,
                                   target: Int(habitForm.xibTargetInput.text!) ?? 0,
                                   timePeriod: timePeriodValue,
                                   measurement: habitForm.xibMeasurementInput.text ?? "",
                                   colorScheme: colorChoice
        )
        
//        figure out how to not new up an entity here
        hvm = HabitViewModel(habitEntity: entity)
        hvm.persistHabit()
        performSegueToReturnBack()
    }
    
}
