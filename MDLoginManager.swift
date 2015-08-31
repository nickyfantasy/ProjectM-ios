//
//  MDLoginManager.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/23/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation
import UIKit

@objc protocol MDLoginCallback {
    func onLoginSuccess()
    optional func onLogOut()
}

class MDLoginManager {
    
    static var userEmail: String?
    static var userId: String?
    static var userName: String?
    
    static var pendingCallback: MDLoginCallback?
    
    static var loginCallbackList = [MDLoginCallback]()
    
    static func loadLoginInfo() {
    
        let defaults = NSUserDefaults.standardUserDefaults()
        userId = defaults.objectForKey("userId") as? String
        userEmail = defaults.objectForKey("userEmail") as? String
        userName = defaults.objectForKey("userName") as? String
    }
    
    static func setLoginInfo(userId: String?, userEmail: String?, userName: String?) {
    
        self.userId = userId
        self.userEmail = userEmail
        self.userName = userName
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(userId, forKey: "userId")
        defaults.setValue(userEmail, forKey: "userEmail")
        defaults.setValue(userName, forKey: "userName")
        defaults.synchronize()
    }
    
    static func isLogin() -> Bool {
        return userId != nil
    }
    
    static func isFbLogin() -> Bool {
        return FBSDKAccessToken.currentAccessToken() != nil
    }
    
    static func logOut() {
        if isFbLogin() {
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            setLoginInfo(nil, userEmail: nil, userName: nil)
            
        }
        
        
        
        for callback in loginCallbackList {
            callback.onLogOut!()
        }
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
        for callback in loginCallbackList {
            callback.onLoginSuccess()
        }
    }
    
    static func onLoginCancelOrFail() {
        pendingCallback = nil
    }
}