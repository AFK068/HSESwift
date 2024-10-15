import UIKit

extension UIColor {
    // MARK: - Constants
    private enum Constants {
        static let upperLimit: Int = Int(pow(16.0, 6)) - 1
        static let maxColorValue: Double = 255.0
        static let shiftBase: Int = 256
        static let shiftBaseSquared: Int = shiftBase * shiftBase
        static let alphaValue: Double = 1.0
    }
    
    // MARK: -Methods
    static func random() -> UIColor {
        let randomValue = Int.random(in: 0...Constants.upperLimit)
        
        let red = Double(randomValue % Constants.shiftBase) / Constants.maxColorValue
        let green = Double((randomValue / Constants.shiftBase) % Constants.shiftBase) / Constants.maxColorValue
        let blue = Double((randomValue / Constants.shiftBaseSquared) % Constants.shiftBase) / Constants.maxColorValue
        
        return UIColor(red: red, green: green, blue: blue, alpha: Constants.alphaValue)
    }
}
