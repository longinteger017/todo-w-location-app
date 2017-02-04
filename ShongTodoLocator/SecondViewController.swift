//
//  SecondViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 04.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var taskField: UITextField!
    @IBOutlet var locationField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        if (taskField.text != ""){
            examples.append(taskField.text!)
            taskField.text = ""
        }
        
        if (locationField.text != ""){
            listOfLocations.append(locationField.text!)
            locationField.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

