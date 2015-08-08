//
//  File.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation

class Utils {
    
    var isChineseSettings = false
    
    func loadSettings() {
        let defaults = NSUserDefaults.standardUserDefaults()
        isChineseSettings = (defaults.objectForKey("isChinese") as? Bool) ?? false
    }


    
    
}