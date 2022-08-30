# EasyFormsPackage

This package allows for developers to create simple and effective forms. 

Current Available Fields:

 - Text Field Entry
 - Toggle Button
 
## Getting Started:  

Your presenting view controller should conform to FormViewControllerDelegate

```
extension ViewController: FormViewControllerDelegate {
``` 

When you would like to show your user a form view, simply create an array of fields you'd like to show, and call the presentFormViewController method in the EasyFormsPackage Class like below... 


```
let usernameFormField = FormField(fieldTitle: "Username", fieldID: "0", fieldType: .textEntry)
let passwordFormField = FormField(fieldTitle: "Password", fieldID: "1", fieldType: .textEntry)
let rememberMeFormField = FormField(fieldTitle: "Password", fieldID: "2", fieldType: .toggleButton)
    
EasyFormsPackage.presentFormViewController(parentViewController: self, fields: [usernameFormField, passwordFormField, rememberMeFormField])
```

The user will be presented with a form view and when they submit, the results can be validated by a method in FormViewControllerDelegate as shown below. Then the user is either shown an error message, or the form is dismissed. 

```
extension ViewController: FormViewControllerDelegate {
    
    func didSubmit(fields: [FormField], validateFieldEntries: (Bool, String?) -> ()) {
        let usernameResponse = fields[0].textResponse
        let passwordResponse = fields[1].textResponse
        let rememberMeResponse = fields[2].toggleReponse
        
        guard usernameResponse != nil &&
                passwordResponse != nil else {
            validateFieldEntries(false, "Please fill in both fields.")
            return
        }
        
        if rememberMeResponse == true {
            // Do something with this
        }
        
        validateFieldEntries(true, nil)
    }
    
    func didCancel() {
        print("FORM CANCELED")
    }

}
```

## Contribute

Anyone is welcome to open an issue or add to this project! Feel free to message me or just cut a branch and start working :)
