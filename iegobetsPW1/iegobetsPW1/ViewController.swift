import UIKit

class ViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let alphaValue: CGFloat = 1
        static let animationDuration: TimeInterval = 0.4
        static let colorComponentRangeMaxValue: Double = 1
        static let cornerRadiusRangeMaxValue: Double = 10
    }
    
    // MARK: - Variables
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    // MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -Actions
    @IBAction func buttonWasPressed(_ sender: Any) {
        self.button.isEnabled = false
        UIView.animate(
            withDuration: Constants.animationDuration,
            animations: {
                self.setRandomColorsToViews()
                self.setRandomCornersRadiusToViews()
            },
            completion: { [weak self] _ in
                self?.button.isEnabled = true
            })
    }
    
    // MARK: -Private methods
    private func getUniqueColors() -> Array<UIColor>{
        var set = Set<UIColor>()
        while set.count != views.count {
            let randomColor = UIColor.random()
            set.insert(randomColor)
        }
        
        return Array(set)
    }
    
    private func setRandomColorsToViews() {
        let uniqueColors = getUniqueColors()
        for (index, view) in views.enumerated() {
            view.backgroundColor = uniqueColors[index]
        }
    }
    
    private func setRandomCornersRadiusToViews() {
        views.forEach { view in
            view.layer.cornerRadius = .random(in: 0...Constants.cornerRadiusRangeMaxValue)
        }
    }
}
