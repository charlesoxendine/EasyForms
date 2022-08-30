# EasyFormsPackage

This package allows for developers to create simple and effective forms. 

** Current Available Fields: **

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

