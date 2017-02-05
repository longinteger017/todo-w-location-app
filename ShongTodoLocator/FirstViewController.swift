//
//  FirstViewController.swift
//  ShongTodoLocator
//
//  Created by admin on 03.02.17.
//  Copyright © 2017 Weeabos. All rights reserved.
//

import UIKit

// make arrays global visible
var examples = [String]()
var listOfLocations = [String]()

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // function in UITableViewSource, used to count the amount of values in array 'examples'
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (examples.count)
    }
    
    /* function which uses the cell for every item you added on second controller;
     * get the location in label to perform data sharing on detail view controller
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FirstViewControllerTableViewCell
    
        if (listOfLocations.count > 0){
            cell.locationLabelFC.text = listOfLocations[indexPath.row]
        }
    
        cell.textLabel?.text = examples[indexPath.row]
        return(cell)
    }
    
    /* adds the remove function when you swipe to the left on a cell in the table view
     * removes a task (in array 'examples') and a location (in array 'listOfLocations')
     */
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            examples.remove(at: indexPath.row)
            listOfLocations.remove(at:indexPath.row)
            tableView.reloadData()
        }
    }
    
    /* function needed for detecting a selection of user on a row / cell which will fire
     * event to move to detail View Controller which can be done with a navigation controller
     * which you can see on story board
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        myVC.stringPassed = listOfLocations[indexPath.row]
        navigationController?.pushViewController(myVC, animated: true)
    }
 
    /* reload the table view because of new todo */
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

