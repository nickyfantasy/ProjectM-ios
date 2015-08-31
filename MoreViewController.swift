//
//  MoreViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/16/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController, UIAlertViewDelegate, MDLoginCallback {
    
    var alertView: UIAlertView!
    
    let hideLoginSections = [1, 3]
    let hideLogoutSections = [0]

    override func viewDidLoad() {
        super.viewDidLoad()

        MDLoginManager.loginCallbackList.append(self)
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
            if hideLoginSections.contains(section) {
                if !MDLoginManager.isLogin() {
                    return 0.1
                }
            } else if hideLogoutSections.contains(section) {
                if MDLoginManager.isLogin() {
                    return 0.1
                }
            }
            return 20
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if hideLoginSections.contains(section) {
            if !MDLoginManager.isLogin() {
                return 0.1
            }
        } else if hideLogoutSections.contains(section) {
            if MDLoginManager.isLogin() {
                return 0.1
            }
        }
        return super.tableView(tableView, heightForHeaderInSection: section)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if hideLoginSections.contains(section) {
            if !MDLoginManager.isLogin() {
                return 0
            }
        } else if hideLogoutSections.contains(section) {
            if MDLoginManager.isLogin() {
                return 0
            }
        }
        return super.tableView(tableView, numberOfRowsInSection:section)
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tag = tableView.cellForRowAtIndexPath(indexPath)!.tag
        if tag == 1 {
            //show get more credits alert
            let title = "How to earn more Mickle Credits"
            let message = "1. If you log in for 7 consecutive days, you will get $2 Mickle Credits. \n\n 2. Add a valid payment method to get $5 Mickle Credits"
            showAlert(title, dismissTitle: "OK", actionTitle: nil, message: message, tag: tag, handler: nil)
        } else if tag == 2 {
            let title = "Are you sure you want to log out of \(MDLoginManager.userName == nil ? MDLoginManager.userEmail! : MDLoginManager.userName!) ?"
            showAlert(title, dismissTitle: "Cancel", actionTitle: "Yes", message: nil, tag: tag, handler: logoutAlertAction)
            
        } else if tag == 3 {
            //show clear history alert
            
            showAlert("Are you sure you want to clear search history?", dismissTitle: "Cancel", actionTitle: "Yes", message: nil, tag: tag, handler: clearHistoryAlertAction)
        } else if tag == 4 {
            //show remove used/expired alert
            
            showAlert("Are you sure you want to clear used/expired coupons in My Coupons section?", dismissTitle: "Cancel", actionTitle: "Yes", message: nil, tag: tag, handler: removedUsedCouponsAlertAction)
        }
    }
    
    func showAlert(title: String, dismissTitle: String, actionTitle: String?, message: String?, tag: Int, handler: ((AnyObject) -> Void)?) {
        
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: dismissTitle, style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(cancelAction)
            
            if actionTitle != nil {
                let mainAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default, handler: handler)
                alertController.addAction(mainAction)
            }
            presentViewController(alertController, animated: true, completion: nil)
            
            
        } else {
            alertView = UIAlertView()
            alertView.tag = tag
            alertView.delegate = self
            alertView.title = title
            alertView.message = message
            alertView.addButtonWithTitle(dismissTitle)
            if actionTitle != nil {
                alertView.addButtonWithTitle(actionTitle)
            }
            alertView.show()
        }
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
            if buttonIndex == 1 {
                if alertView.tag == 2 {
                    logoutAlertAction(nil)
                } else if alertView.tag == 3 {
                    clearHistoryAlertAction(nil)
                } else if alertView.tag == 4 {
                    removedUsedCouponsAlertAction(nil)
                }
            }
    }
    
    //@available(iOS 8.0, *)
    func logoutAlertAction(alert: AnyObject?) -> Void {
        MDLoginManager.logOut()
    }
    
    func clearHistoryAlertAction(alert: AnyObject?) -> Void {
        
    }
    
    func removedUsedCouponsAlertAction(alert: AnyObject?) -> Void {
        
    }

    func onLoginSuccess() {
        tableView.reloadData()
    }
    
    func onLogOut() {
        tableView.reloadData()
    }
    
}
