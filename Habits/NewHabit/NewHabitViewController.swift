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
    
    @IBOutlet weak var timePeriodStackView: UIStackView!
//    let colorChoices = allColors

//    @IBOutlet weak var colorChoiceStackView: UIStackView!
    
    @IBOutlet weak var habitFormView: HabitForm!
//
//
//    var timePeriodValue = String()
//    var colorChoice = String()
    
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
    
//    var timePeriodChoices: [String] {
//        return TimePeriod.allCases.map({$0.rawValue})
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habitFormView.xibHabitNameInput.delegate = self
        habitFormView.xibTargetInput.delegate = self
        habitFormView.xibMeasurementInput.delegate = self
        
        habitFormView.xibHabitNameInput.placeholder = "HABIT NAME"
        habitFormView.xibTargetInput.placeholder = "4"
        habitFormView.xibMeasurementInput.placeholder = "DAILY"

//        for choice in timePeriodChoices {
//            timePeriodStackView.addArrangedSubview(makeButtonsWithText(choice))
//        }
//
//        for choice in Array(colorChoices.keys) {
//            colorChoiceStackView.addArrangedSubview(makeColorButtons(choice))
//        }
    }
    
   
    
    
//    func makeButtonsWithText(_ text: String)-> UIButton {
//        let timePeriodButton = UIButton(type: UIButton.ButtonType.system)
//        let width = timePeriodButton.intrinsicContentSize.width
//        timePeriodButton.frame = CGRect(x: 20, y: 20, width: width, height: 100)
//        timePeriodButton.setTitle(text, for: .normal)
//        timePeriodButton.setTitleColor(UIColor.black, for: .normal)
//        timePeriodButton.layer.cornerRadius = 10
//        timePeriodButton.sizeToFit()
//        timePeriodButton.addTarget(self, action: #selector(selectButtonValue), for: .touchUpInside)
//
//        return timePeriodButton
//    }
//
//    func makeColorButtons(_ color: String) -> UIButton {
//        let colorChoiceButton = UIButton(type: UIButton.ButtonType.system)
//        colorChoiceButton.backgroundColor = allColors[color]!.primary
//        colorChoiceButton.accessibilityIdentifier = color
//
//        let width = colorChoiceButton.intrinsicContentSize.width
//        colorChoiceButton.frame = CGRect(x: 20, y: 20, width: width, height: 10)
//        colorChoiceButton.layer.masksToBounds = true
//        colorChoiceButton.layer.cornerRadius = colorChoiceButton.frame.width/2
//
//        colorChoiceButton.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
//        return colorChoiceButton
//
//    }
    
//    @IBAction func selectButtonValue(sender:UIButton){
//        for button in timePeriodStackView.subviews {
//            if button is UIButton {
//                button.backgroundColor = UIColor.white
//            }
//        }
//        sender.backgroundColor = UIColor.lightGray
//        timePeriodValue = sender.titleLabel!.text ?? "daily"
//    }
//
//    @IBAction func selectColor(sender:UIButton){
//        for button in colorChoiceStackView.subviews {
//            if button is UIButton {
//                button.layer.borderWidth = 0
//                button.layer.borderColor = UIColor.white.cgColor
//            }
//        }
//        sender.layer.borderColor = UIColor.black.cgColor
//        sender.layer.borderWidth = 2
//        colorChoice = sender.accessibilityIdentifier ?? "cyan"
//    }
    
    
}
