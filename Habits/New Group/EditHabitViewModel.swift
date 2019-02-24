import UIKit


fileprivate let roundedButtonRadious = CGFloat(10)
fileprivate func buttonRect(_ width: CGFloat) -> CGRect {
    return CGRect(x: 20, y: 20, width: width, height: 100)
}

func unhighlightAllButtons(_ stackView: UIStackView) {
    for button in stackView.subviews {
        if button is UIButton {
            button.layer.borderWidth = 0
        }
    }
}

func highlightSelectedButton(_ button: UIButton) {
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 2
}

func highlightButtonMatchingChoice(_ stackView: UIStackView, _ value: String) {
    for button in stackView.subviews {
        if button is UIButton && button.accessibilityIdentifier == value {
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 2
        }
    }
}

func getButtonTemplate() -> UIButton {
    let button = UIButton(type: UIButton.ButtonType.system)
    button.frame = buttonRect(button.intrinsicContentSize.width)
    button.layer.cornerRadius = roundedButtonRadious
    button.sizeToFit()
    return button
}

func makeButtonsWithText(_ text: String)-> UIButton {
    let button = getButtonTemplate()
    button.setTitle(text, for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.accessibilityIdentifier = text
    return button
}

func makeColorButtons(_ color: String) -> UIButton {
    let button = getButtonTemplate()
    button.backgroundColor = allColors[color]!.primary
    button.accessibilityIdentifier = color
    button.layer.cornerRadius = button.frame.width/2
    return button
    
}
