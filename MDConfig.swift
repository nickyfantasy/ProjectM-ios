//
//  MDConfig.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/9/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation
import UIKit

class MDConfig {
    
    static var isChineseSettings = false
    static var isIos8Above = false
    static var deviceWidth: CGFloat = 0
    static var deviceHeight: CGFloat = 0
    
    
    static func loadConfig() {
        let defaults = NSUserDefaults.standardUserDefaults()
        isChineseSettings = (defaults.objectForKey("isChinese") as? Bool) ?? false
        
        if #available(iOS 8.0, *) {
            isIos8Above = NSProcessInfo().isOperatingSystemAtLeastVersion(NSOperatingSystemVersion(majorVersion: 8, minorVersion: 0, patchVersion: 0))
        } else {
            isIos8Above = false
        }
        
        deviceWidth = UIScreen.mainScreen().applicationFrame.width
        deviceHeight = UIScreen.mainScreen().applicationFrame.height
    }
    
}
