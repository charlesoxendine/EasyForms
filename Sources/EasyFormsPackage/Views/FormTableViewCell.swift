//
//  File.swift
//  
//
//  Created by Charles Oxendine on 8/23/22.
//

import Foundation
import UIKit

protocol FormTableViewCellDelegate {
    func changedResponse(response: String?, fieldID: String!)
}

class FormTableViewCell: UITableViewCell {
    
    var formView: FormField?
    
    var formThemeColor: UIColor! = UIColor.black
    
    var delegate: FormTableViewCellDelegate?
    
}
