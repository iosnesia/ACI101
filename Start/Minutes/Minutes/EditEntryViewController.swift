import Foundation
import UIKit
import AppCenter
import AppCenterCrashes

class EditEntryViewController: UIViewController
{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var entry: Entry? = nil
    
    override func viewDidLoad()
    {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(EditEntryViewController.onSave))
        MSAppCenter.start("080ad295-27ab-4533-96e2-21f49844788b", withServices:[
          MSCrashes.self
        ])
        MSAppCenter.start("080ad295-27ab-4533-96e2-21f49844788b", withServices:[
          MSCrashes.self
        ])
        navigationItem.rightBarButtonItem = saveButton

        if entry == nil
        {
            entry = Entry()
            self.title = "Add New Entry"
        }
        
        titleTextField.text = entry?.title
        contentTextView.text = entry?.content
    }

    @objc func onSave(_ sender: UIBarButtonItem)
    {
        entry?.title = titleTextField.text!
        entry?.content = contentTextView.text!
        
        AppDelegate.entries.write(entry!)
                
        navigationController?.popViewController(animated: true)
    }
}
