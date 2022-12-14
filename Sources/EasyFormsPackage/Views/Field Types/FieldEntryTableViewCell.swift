//
//  FieldEntryTableViewCell.swift
//  EasyFormsPackage
//
//  Created by Charlie Oxendine on 6/21/21.
//

import UIKit

protocol FieldEntryTableViewCellDelegate {
    func cellTapped(_ cell: UITableViewCell)
}

class FieldEntryTableViewCell: FormTableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var showPwd: UIImageView!
    
    var cellDelegate: FieldEntryTableViewCellDelegate?

    override var formView: FormField? {
        didSet {
            self.captionLabel.text = formView?.fieldTitle
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.textField.tintColor = self.formThemeColor
        self.textField.tintColorDidChange()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
        
        captionLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        captionLabel.textColor = UIColor.black
        
        lineView.backgroundColor = UIColor.clear
        textField.autocorrectionType = .no
        
        let tapPwdGesture = UITapGestureRecognizer(target: self, action: #selector(self.tooglePwdVisible(_:)))
        self.showPwd.addGestureRecognizer(tapPwdGesture)
    }
    
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.cellTapped(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        cellDelegate?.cellTapped(self)
    }
    
    @objc func tooglePwdVisible(_ sender: UITapGestureRecognizer) {
        if textField.isSecureTextEntry {
            textField.isSecureTextEntry = false
            showPwd.image = UIImage(named: "invisiblepwd")
        } else {
            textField.isSecureTextEntry = true
            showPwd.image = UIImage(named: "visiblepwd")
        }
    }
}

extension FieldEntryTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.delegate?.changedResponse(response: textField.text, fieldID: self.formView?.fieldID)
    }
}
