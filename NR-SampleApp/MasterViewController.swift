//
//  MasterViewController.swift
//  NR-SampleApp
//
//  Created by Edison Castro on 3/13/20.
//  Copyright © 2020 Edison Castro. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        NewRelic.recordBreadcrumb("MasterViewController"
        , attributes:["Name" : "viewDidLoad", "userId" : "SampleUser", "action" : "tapped", "location" : "MasterViewController:viewDidLoad"])

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NewRelic.recordCustomEvent("MobileCustomEdTest",name:"Test", attributes: ["where" : "MasterViewController:viewDidLoad", "value": 1])
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        NewRelic.recordCustomEvent("MobileCustomEdTest",name:"Test",  attributes: ["where" : "MasterViewController:viewWillAppear", "value": 2])
        NewRelic.recordBreadcrumb("MasterViewController"
        , attributes:["Name" : "viewWillAppear", "userId" : "SampleUser", "action" : "tapped", "location" : "MasterViewController:viewWillAppear"])
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        NewRelic.recordBreadcrumb("MasterViewController"
        , attributes:["Name" : "insertNewObject", "userId" : "SampleUser", "action" : "tapped", "location" : "MasterViewController:insertNewObject"])
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NewRelic.recordBreadcrumb("MasterViewController"
        , attributes:["Name" : "prepare", "userId" : "SampleUser", "action" : "tapped", "location" : "MasterViewController:prepare"])
        NewRelic.recordCustomEvent("MobileCustomEdTest",name:"Test",  attributes: ["where" : "MasterViewController:prepare", "value": 3])
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = objects[indexPath.row] as! NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

