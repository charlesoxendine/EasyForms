//
//  FieldEntryTableViewCell.swift
//  EasyForms
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

    var textDelegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = textDelegate
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
