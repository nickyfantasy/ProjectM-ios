//
//  CouponInfo.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation

struct CouponInfo {
    
    let id: Int
    var description = "" //set all string to empty string so that do not need to implement in init()
    var descriptionCh = ""
    var storeName = ""
    var storeNameCh = ""
    var price = Float(0)
    var address = ""
    var addressShort = ""
    
    
    //temp
    var imageStr = ""
    var imageSmallStr = ""
    
    init(id: Int) {
        self.id = id
    }
    
    
    
    
}

