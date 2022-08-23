import Foundation
import UIKit

public struct EasyFormsPackage {
    
    private var tintColor: UIColor!

    public init(tintColor: UIColor = UIColor.black) {
        self.tintColor = tintColor
    }
    
    public static func getFormViewController(parentViewController: UIViewController, fields: [FormField]) {
        let storyboard: UIStoryboard = UIStoryboard(name: "FormView", bundle: nil)
        if let newVC = storyboard.instantiateViewController(withIdentifier: "FormViewController") as? FormViewController {
            newVC.fields = fields
            parentViewController.present(newVC, animated: true)
        }
    }
    
}
