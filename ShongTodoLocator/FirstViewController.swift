//
//  FirstViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 04.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit


var examples = ["Create two controll view", "Create a cell", "create custom cell", "create task and location on second view", "share data from 2 to 1"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
      public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (examples.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = examples[indexPath.row]
        return(cell)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            examples.remove(at: indexPath.row)
            tableView.reloadData()
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

