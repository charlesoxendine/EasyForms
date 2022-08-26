import Foundation
import UIKit

public struct EasyFormsPackage {
    
    public static func getFormViewController(parentViewController: UIViewController, fields: [FormField], themeColor: UIColor! = UIColor.black) {
        let newVC =  FormViewController()
        newVC.fields = fields
        newVC.formThemeColor = themeColor
        
        let navigationController = UINavigationController(rootViewController: newVC)
        
        guard let parentViewControllerDelegate = parentViewController as? FormViewControllerDelegate else {
            fatalError("Make sure to make your presenting view controller conform to FormViewControllerDelegate.")
        }
        
        newVC.delegate = parentViewControllerDelegate
        navigationController.modalPresentationStyle = .fullScreen
        parentViewController.present(navigationController, animated: true)
    }
    
}
