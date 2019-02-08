import UIKit

class HabitForm: UIView, UITextFieldDelegate {
    @IBOutlet var contentView: UIView!
   
    @IBOutlet weak var xibHabitNameInput: UITextField!
    @IBOutlet weak var xibTargetInput: UITextField!
    @IBOutlet weak var xibMeasurementInput: UITextField!
    
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
