//
//  LoginViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/23/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loginCompletionHandler() {
        
        MDLoginManager.onLoginSuccess()
    }

    @IBAction func loginAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: loginCompletionHandler)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
