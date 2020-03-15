//
//  DetailViewController.swift
//  NR-SampleApp
//
//  Created by Edison Castro on 3/13/20.
//  Copyright © 2020 Edison Castro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var URLTextField: UITextField!
    
    @IBAction func SampleAction(_ sender: UIButton) {
        //NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "DetailViewController:SampleAction", "value": 1])
        print("TEST")
        NewRelic.recordBreadcrumb("DetailViewController"
        , attributes:["Name" : "SampleAction", "userId" : "SampleUser", "action" : "tapped", "location" : "DetailViewController:configureView"])
        let capturedUrl = URLTextField.text!
        let url = URL(string: capturedUrl)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("error: \(error)")
                        NewRelic.recordBreadcrumb("Error Scenario"
                        , attributes:["Name" : "Call URL", "userId" : "SampleUser", "ErrorMessage" : error, "location" : "DetailViewController:SampleAction"])
                        NewRelic.recordCustomEvent("MobileCustomErrors",name:"Error Scenario",  attributes: ["ErrorMessage" : "DetailViewController:SampleAction", "value": error])
                    } else {
                        if let response = response as? HTTPURLResponse {
                            print("statusCode: \(response.statusCode)")
                        }
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("data: \(dataString)")
                        }
                    }
                }
                task.resume()

        
        
    }
    

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "DetailViewController:configureView", "value": 2])
        NewRelic.recordBreadcrumb("DetailViewController"
        , attributes:["Name" : "configureView", "userId" : "SampleUser", "action" : "tapped", "location" : "DetailViewController:configureView"])
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
                //var attributeSet = NewRelic.setAttribute("DetailedViewDescription", value: detail.description)
                //attributeSet = NewRelic.setAttribute("testValue", value: 9999.99)
            }
        }

    }

    override func viewDidLoad() {
        NewRelic.recordCustomEvent("MobileCustomEdTest", attributes: ["where" : "DetailViewController:viewDidLoad", "value": 3])
        NewRelic.recordBreadcrumb("DetailViewController"
        , attributes:["Name" : "viewDidLoad", "userId" : "SampleUser", "action" : "tapped", "location" : "DetailViewController:viewDidLoad"])
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            NewRelic.recordBreadcrumb("DetailViewController"
            , attributes:["Name" : "detailItem", "userId" : "SampleUser", "action" : "tapped", "location" : "DetailViewController:detailItem"])
            configureView()
        }
    }


}

