//
//  LoginViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/23/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate  {
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var fbButton: FBSDKLoginButton!
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
        
        fbButton.applyShadow(2, opacity: 0.3, xOffset: 1, yOffset: 1.5, useShadowPath: MDConfig.isIos8Above ? false : true)
        let image = UIImage(named: "full_logo.png")
        navItem.titleView = UIImageView(image: image)
        navBar.applyBarShadow()
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            fbButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 19)
            fbButton.readPermissions = ["public_profile", "email", "user_birthday"]
            fbButton.delegate = self
        }

        // Do any additional setup after loading the view.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                print("Contains email permission")
                // Do work
            } else {
                print(" does not contain email permissison")
            }
            returnUserData()
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"name,id,email,gender,birthday"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                
                
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                let userEmail : NSString = result.valueForKey("email") as! NSString
                let userId : NSString = result.valueForKey("id") as! NSString
                
                let birthday : NSString? = result.valueForKey("birthday") as? NSString
                let gender : NSString? = result.valueForKey("gender") as? NSString
                
                //comment out the log and just send to server
                print("userName = \(userName) userEmail = \(userEmail) userId = \(userId)")
                print("birthday = \(birthday) gender = \(gender)")
            }
        })
    }
}


//if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"]) {
//    [[[FBSDKGraphRequest alloc]
//        initWithGraphPath:@"me/feed"
//        parameters: @{ @"message" : @"hello world"}
//    HTTPMethod:@"POST"]
//    startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//        if (!error) {
//            NSLog(@"Post id:%@", result[@"id"]);
//        }
//    }];
//}
