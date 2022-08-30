//
//  ToggleButtonTableViewCell.swift
//  
//
//  Created by Charles Oxendine on 8/29/22.
//

import UIKit

class ToggleButtonTableViewCell: FormTableViewCell {

    @IBOutlet weak var toggleButton: UISwitch!
    @IBOutlet weak var formFieldTitleValue: UILabel!
    
    override var formView: FormField? {
        didSet {
            if formView?.toggleReponse == nil {
                formView?.toggleReponse = toggleButton.isOn
            }
            
            formFieldTitleValue.text = formView?.fieldTitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func buttonToggled(_ sender: Any) {
        delegate?.changedResponse(response: self.toggleButton.isOn, fieldID: formView?.fieldID)
    }
}
