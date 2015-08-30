//
//  MDLoginManager.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/23/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation
import UIKit

protocol MDLoginCallback {
    func onLoginSuccess()
}

class MDLoginManager {
    
    static var userEmail: String?
    static var userId: String?
    
    static var pendingCallback: MDLoginCallback?
    
    static func loadLoginInfo() {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        userId = defaults.objectForKey("userId") as? String
        userEmail = defaults.objectForKey("userEmail") as? String
    }
    
    static func isLogin() -> Bool {
        return userId != nil
    }
    
    static func isFbLogin() -> Bool {
        return FBSDKAccessToken.currentAccessToken() != nil
    }
    
    static func loginIfNecessary(vc: UIViewController, callback: MDLoginCallback) {
        if isLogin() {
            callback.onLoginSuccess()
        } else {
            pendingCallback = callback
            
            let loginVC = vc.storyboard?.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            vc.presentViewController(loginVC, animated: true, completion: nil)
        }
    }
    
    static func onLoginSuccess() {
        if pendingCallback != nil {
            pendingCallback!.onLoginSuccess()
            pendingCallback = nil
        }
    }
    
    static func onLoginCancelOrFail() {
        pendingCallback = nil
    }
}