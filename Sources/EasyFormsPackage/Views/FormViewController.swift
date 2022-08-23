//
//  FormViewController.swift
//  SwiftyForms
//
//  Created by Charles Oxendine on 8/22/22.
//

import UIKit

enum FormFieldTypes {
    case textEntry
    case toggleButton
    
    func getTableCellIdentifier() -> String {
        switch self {
        case .textEntry:
            return "TextEntryTableViewCell"
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
}

class FormViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public var fields: [FormField] = [] {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ["TextEntryTableViewCell", "ToggleButtonTableViewCell"].forEach( {
            tableView.register(UINib.init(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
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
