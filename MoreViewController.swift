//
//  MoreViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/16/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == tableView.numberOfSections - 1 {
            
            let footerView = UILabel()
            footerView.text = "All Rights Reserved © MickleDeals LLC\n\nVersion 1.0"
            footerView.textAlignment = NSTextAlignment.Center
            footerView.textColor = UIColor.lightGrayColor()
            footerView.font = footerView.font.fontWithSize(13)
            footerView.numberOfLines = 0
            
        return footerView
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == tableView.numberOfSections - 1 {
            return 100
        } else {
            return 20
        }
    }
    
//    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//        if section == tableView.numberOfSections - 1 {
//            view.backgroundColor = UIColor.redColor()
//        }
//    }
    
//    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == tableView.numberOfSections - 1 {
//            return "hihihi\nhihihi"
//        }
//        return ""
//        
//            - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//                [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextAlignment:NSTextAlignmentCenter];
//                return [sectionTitles objectAtIndex:section];
//        }
//        
//    }
    
//    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//        let footerView = view as? UITableViewHeaderFooterView
//        if footerView != nil {
//            footerView!.textLabel!.text = "HIHIHI"
//        }
//    }
    

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)!
//        if cell.tag == 1 {
//            cell.backgroundView = UIView()
//        }
//
//
//        return cell
//    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
