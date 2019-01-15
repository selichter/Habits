import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

struct ColorScheme {
    let primary: UIColor
    let secondary: UIColor
    let surface: UIColor
}

let allColors = [
    "red": ColorScheme(primary: UIColor(rgb: 0xF44336), secondary: UIColor(rgb: 0xFFEBEE), surface: UIColor(rgb: 0xFFFFFF)),
    "deepPurple": ColorScheme(primary: UIColor(rgb: 0x6200ee), secondary: UIColor(rgb: 0xFFDBFF), surface: UIColor(rgb: 0xFFFFFF)),
    "purple": ColorScheme(primary: UIColor(rgb: 0x9C27B0), secondary: UIColor(rgb: 0xF3E5F5), surface: UIColor(rgb: 0xFFFFFF)),
    
    "indigo": ColorScheme(primary: UIColor(rgb: 0x3F51B5), secondary: UIColor(rgb: 0xE8EAF6), surface: UIColor(rgb: 0xFFFFFF)),
    "blue": ColorScheme(primary: UIColor(rgb: 0x2196F3), secondary: UIColor(rgb: 0xE3F2FD), surface: UIColor(rgb: 0xFFFFFF)),
    "cyan": ColorScheme(primary: UIColor(rgb: 0x00BCD4), secondary: UIColor(rgb: 0xE0F7FA), surface: UIColor(rgb: 0xFFFFFF)),
    "green": ColorScheme(primary: UIColor(rgb: 0x4CAF50), secondary: UIColor(rgb: 0xE8F5E9), surface: UIColor(rgb: 0xFFFFFF)),
    "lime": ColorScheme(primary: UIColor(rgb: 0xCDDC39), secondary: UIColor(rgb: 0xF9FBE7), surface: UIColor(rgb: 0xFFFFFF)),
    "amber": ColorScheme(primary: UIColor(rgb: 0xFFC107), secondary: UIColor(rgb: 0xFFF8E1), surface: UIColor(rgb: 0xFFFFFF)),
    "blueGray": ColorScheme(primary: UIColor(rgb: 0x607D8B), secondary: UIColor(rgb: 0xECEFF1), surface: UIColor(rgb: 0xFFFFFF))    
]
