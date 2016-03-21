//
//  filtersViewController.swift
//  Yelp
//
//  Created by Sumaiya Mansur on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol filtersViewControllerDelegate {
    optional func FiltersViewController (FiltersViewController: filtersViewController, didUpdatefilters filters: [String: AnyObject])
}

class filtersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, switchCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: filtersViewControllerDelegate?
    
    var categories: [[String:String]]!
    var switchStates  = [Int:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = yelpCategories()
        
        tableView.dataSource = self
        tableView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categories != nil {
            return categories!.count
        } else {
            return 0
        }
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("switchCellView", forIndexPath: indexPath) as! SwitchCell
        cell.switchLabel.text = categories[indexPath.row]["name"]
        cell.delegate = self
        
        cell.onSwitch.on =
            switchStates[indexPath.row] ?? false
        
        return cell
    
    }
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
    let indexPath = tableView.indexPathForCell(switchCell)!
        switchStates[indexPath.row] = value
    }

    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearchButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var filters = [String: AnyObject]()
        var selectedCategories = [String]()
        for (row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        if selectedCategories.count > 0 {
            filters["catgories"] = selectedCategories
        }
    
        delegate?.FiltersViewController?(self, didUpdatefilters: filters)
}
    func yelpCategories() -> [[String:String]] {
        return [["name" : "Afgan", "code": "afgani"],
            ["name" : "Bangladesh", "code": "bangladeshi"],
            ["name" : "India", "code": "Indian"],
            ["name" : "China", "code": "Chinese"],
            ["name" : "Korea", "code": "Korean"],
            ["name" : "America", "code": "new american"],
            ["name" : "Pakistan", "code": "pakistani"],
            ["name" : "Thailand", "code": "Thai"],
]

    }
    
}
