import Foundation
import UIKit

public struct EasyFormsPackage {
    
    public static func getFormViewController(parentViewController: UIViewController, fields: [FormField], themeColor: UIColor! = UIColor.black) {
        let newVC =  FormViewController()
        newVC.fields = fields
        newVC.formThemeColor = themeColor
        
        let navigationController = UINavigationController(rootViewController: newVC)
        navigationController.modalPresentationStyle = .fullScreen
        parentViewController.present(navigationController, animated: true)
    }
    
}
