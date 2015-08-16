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
    var description: String! 
    var descriptionCh: String!
    var storeName: String!
    var storeNameCh: String!
    var price = Float(0)
    var address: String!
    var addressShort: String!
    var finePrintText: String!
    
    //temp
    var imageStr: String!
    var imageSmallStr: String!
    
    init(id: Int) {
        self.id = id
    }
    
    
    
    
}

