import Foundation
import UIKit

public struct EasyFormsPackage {
    
    private var tintColor: UIColor!

    public init(tintColor: UIColor = UIColor.black) {
        self.tintColor = tintColor
    }
    
    public static func getFormViewController(parentViewController: UIViewController, fields: [FormField]) {
        let newVC =  FormViewController()
        newVC.fields = fields
        let navigationController = UINavigationController(rootViewController: newVC)
        parentViewController.present(navigationController, animated: true)
    }
    
}
