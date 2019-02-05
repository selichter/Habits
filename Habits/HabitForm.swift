import UIKit

class HabitForm: UIView, UITextFieldDelegate {
    @IBOutlet var contentView: UIView!
   
    @IBOutlet weak var xibHabitNameInput: UITextField!
    @IBOutlet weak var xibTargetInput: UITextField!
    @IBOutlet weak var xibMeasurementInput: UITextField!
    
    @IBOutlet weak var timePeriodStackView: UIStackView!
    var timePeriodValue = String()
    var timePeriodChoices: [String] {
        return TimePeriod.allCases.map({$0.rawValue})
    }
    
    let colorChoices = allColors
    var colorChoice = String()
    @IBOutlet weak var colorChoicesStackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed("HabitForm", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        for choice in timePeriodChoices {
            timePeriodStackView.addArrangedSubview(makeButtonsWithText(choice))
        }
        
        for choice in Array(colorChoices.keys) {
            colorChoicesStackView.addArrangedSubview(makeColorButtons(choice))
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
    
    func makeColorButtons(_ color: String) -> UIButton {
        let colorChoiceButton = UIButton(type: UIButton.ButtonType.system)
        colorChoiceButton.backgroundColor = allColors[color]!.primary
        colorChoiceButton.accessibilityIdentifier = color
        
        let width = colorChoiceButton.intrinsicContentSize.width
        colorChoiceButton.frame = CGRect(x: 20, y: 20, width: width, height: 10)
        colorChoiceButton.layer.masksToBounds = true
        colorChoiceButton.layer.cornerRadius = colorChoiceButton.frame.width/2
        
        colorChoiceButton.addTarget(self, action: #selector(selectColor), for: .touchUpInside)
        return colorChoiceButton
        
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
    
    @IBAction func selectColor(sender:UIButton){
        for button in colorChoicesStackView.subviews {
            if button is UIButton {
                button.layer.borderWidth = 0
                button.layer.borderColor = UIColor.white.cgColor
            }
        }
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 2
        colorChoice = sender.accessibilityIdentifier ?? "cyan"
    }
}
