//
//  FormViewController.swift
//  SwiftyForms
//
//  Created by Charles Oxendine on 8/22/22.
//

import UIKit

public enum FormFieldTypes {
    case textEntry
    case toggleButton
    
    func getTableCellIdentifier() -> String {
        switch self {
        case .textEntry:
            return "FieldEntryTableViewCell"
        case .toggleButton:
            return "ToggleButtonTableViewCell"
        }
    }
    
    func getFieldHeight() -> Int {
        switch self {
        case .textEntry:
            return 80
        case .toggleButton:
            return 80
        }
    }
}

public struct FormField {
    var fieldTitle: String!
    var fieldID: String!
    var fieldType: FormFieldTypes!
    
    public init(fieldTitle: String, fieldID: String?, fieldType: FormFieldTypes) {
        self.fieldTitle = fieldTitle
        self.fieldID = fieldID
        self.fieldType = fieldType
    }
}

class FormViewController: UIViewController {
       
    private var tableView: UITableView!
    
    var footerView: SingleButtonFooterView?
    
    public var fields: [FormField] = [] {
        didSet {
            if tableView != nil {
                tableView.reloadData()
            }
        }
    }
    
    public var formThemeColor: UIColor! = UIColor.black {
        didSet {
            if tableView != nil {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyan
        
        setTableViewController()
        
        if #available(iOS 13.0, *) {
            setBackButtonOnNav()
        } else {
            // TODO: Fallback on earlier versions
        }
    }
    
    @available(iOS 13.0, *)
    private func setBackButtonOnNav() {
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        backbutton.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    @objc func backButtonTapped() {
        self.navigationController!.dismiss(animated: true)
    }
    
    func setTableViewController() {
        let tableView = UITableView()
        self.tableView = tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
                
        ["FieldEntryTableViewCell"].forEach( {
            self.tableView.register(UINib.init(nibName: $0, bundle: .module), forCellReuseIdentifier: $0)
        })
        
        self.footerView = Bundle.main.loadNibNamed("SingleButtonFooterView", owner: self, options: nil)?.first as? SingleButtonFooterView
        footerView?.delegate = self
        footerView?.autoresizingMask = []
        tableView.tableFooterView = footerView
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)
        let topConstraint = NSLayoutConstraint(item: self.tableView!, attribute: .top, relatedBy: .equal, toItem: self.tableView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        let leadingConstraint = NSLayoutConstraint(item: self.tableView!, attribute: .leading, relatedBy: .equal, toItem: self.tableView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        let trailingConstraint = NSLayoutConstraint(item: self.tableView!, attribute: .trailing, relatedBy: .equal, toItem: self.tableView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        let bottomConstraint = NSLayoutConstraint(item: self.tableView!, attribute: .bottom, relatedBy: .equal, toItem: self.tableView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        self.view.addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        self.tableView.reloadData()
    }

}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formView = self.fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: formView.fieldType.getTableCellIdentifier()) as? FormTableViewCell
        cell!.formView = formView
        cell?.formThemeColor = self.formThemeColor
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fields.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let formView = self.fields[indexPath.row]
        return CGFloat(formView.fieldType.getFieldHeight())
    }
}
