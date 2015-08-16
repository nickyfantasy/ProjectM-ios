//
//  FilterListController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/9/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class FilterListController: UIViewController, UITableViewDelegate, UIScrollViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var filterTitle: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    weak var browseViewController: BrowseViewController? = nil
    var tagFromSender = 0
    var filterListData: [String] = []
    var selectedRow = 0
    
    @IBAction func dismissBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterTitle.title = self.title
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FilterCell")
        if MDConfig.isIos8Above {
            tableView.backgroundColor = UIColor(white: 1.0, alpha: 0.92)
        }
        
    }


    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterListData.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)

        cell.textLabel!.text = filterListData[indexPath.row]
        if MDConfig.isIos8Above {
            cell.backgroundColor = UIColor.clearColor()
        }
        
        if indexPath.row == selectedRow {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        browseViewController?.onFilterSelected(filterListData[indexPath.row], filterSelectedRow: indexPath.row, filterTag: tagFromSender)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
