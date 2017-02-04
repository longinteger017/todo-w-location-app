//
//  FirstViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 04.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit

var examples = [String]()
//["create task and location on second view", "share data from 2 to 1"]
var listOfLocations = [String]()
    //["test","test2"]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
      public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (examples.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FirstViewControllerTableViewCell
         print(listOfLocations)
        if (listOfLocations.count > 0){
        
        cell.locationLabelFC.text = listOfLocations[indexPath.row]
           // print(listOfLocations)
        }
    
        cell.textLabel?.text = examples[indexPath.row]
        
        return(cell)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            examples.remove(at: indexPath.row)
            listOfLocations.remove(at:indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
         myVC.stringPassed = listOfLocations[indexPath.row]
        
        navigationController?.pushViewController(myVC, animated: true)
    }
 
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   

}

