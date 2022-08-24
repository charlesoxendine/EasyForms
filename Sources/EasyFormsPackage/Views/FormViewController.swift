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
        self.fieldType = fieldType
        self.fieldID = fieldID
        self.fieldType = fieldType
    }
}

class FormViewController: UIViewController {
       
    private var tableView: UITableView!
    
    public var fields: [FormField] = [] {
        didSet {
            if tableView != nil {
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.cyan
        
        setTableViewController()
    }
    
    func setTableViewController() {
        let tableView = UITableView()
        self.tableView = tableView
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
                
        ["TextEntryTableViewCell", "ToggleButtonTableViewCell"].forEach( {
            self.tableView.register(UINib.init(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: formView.fieldType.getTableCellIdentifier())
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
