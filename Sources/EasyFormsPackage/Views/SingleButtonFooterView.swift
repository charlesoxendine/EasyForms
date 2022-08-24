//
//  singleButtonFooterView.swift
//  Sizzle-Chef-App
//
//  Created by Charles Oxendine on 10/14/21.
//

import UIKit

protocol singleButtonFooterViewDelegate {
    func didTapButton()
}

class SingleButtonFooterView: UIView {

    @IBOutlet weak var mainButton: UIButton!
    
    var delegate: singleButtonFooterViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    func setUI() {
        mainButton.backgroundColor = UIColor.black
        mainButton.setTitleColor(.white, for: .normal)
        mainButton.layer.cornerRadius = 10
    }

    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.didTapButton()
    }
}
