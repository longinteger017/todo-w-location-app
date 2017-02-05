//
//  SecondViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 03.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var taskField: UITextField!
    @IBOutlet var locationField: UITextField!
    
    /* this function is activated when the user clicks on
     * the button on this controller and it checks, if
     * the user has given any input, if he did, those
     * written task and locations will be appended to
     * the global arrays 'examples' and 'listOfLocations'
     */
    @IBAction func addButton(_ sender: Any) {
        if (taskField.text != ""){
            examples.append(taskField.text!)
            taskField.text = ""
        }
        
        if (locationField.text != ""){
            listOfLocations.append(locationField.text!)
            locationField.text = ""
        }

        /* save function, but doesn't work yet
        let defaults = UserDefaults.standard
        
        defaults.set(taskField.text, forKey: "task")
        defaults.set(locationField.text, forKey: "location")
        defaults.synchronize()
        
        print("fn=\(taskField.text), ln=\(locationField.text)")
        */
    }
    
    /* for saving purpose, doesn't work yet
    func loadDefaults() {
        let defaults = UserDefaults.standard
        taskField.text = defaults.object(forKey: "task") as? String
        locationField.text = defaults.object(forKey: "location") as? String
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

