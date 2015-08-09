//
//  DataListModel.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation

class DataListModel {
    
    private(set) var list = [CouponInfo]()
    
    
    
    class var instance : DataListModel {
        struct Singleton {
            static let sharedInstance = DataListModel()
        }
        return Singleton.sharedInstance
    }
    
    init() {
        
        var coupon1 = CouponInfo(id: 1)
        coupon1.description = "Free Strawberry Pudding when spent more than $30"
        coupon1.descriptionCh = "消費滿$30即獲免費草莓布丁1分"
        coupon1.price = 1
        coupon1.storeName = "BlueSky Dessert"
        coupon1.storeNameCh = "藍天甜品屋"
        coupon1.address = "2522 Lawton St, San Francisco";
        coupon1.addressShort = "Sunset • San Francisco";
        coupon1.imageStr = "pic_1.jpg"
        coupon1.imageSmallStr = "pic_1_s.jpg"
        list.append(coupon1)
        
        
        var coupon2 = CouponInfo(id: 2)
        coupon2.description = "10% Off Discount"
        coupon2.descriptionCh = "結帳時享有9折優惠"
        coupon2.price = 2
        coupon2.storeName = "Savory Steak House"
        coupon2.address = "2383 Woodrew St, Daly City";
        coupon2.addressShort = "Daly City";
        coupon2.imageStr = "pic_2.jpg"
        coupon2.imageSmallStr = "pic_2_s.jpg"
        list.append(coupon2)
        
        
        list.append(coupon1)
        list.append(coupon2)
        
        
        list.append(coupon1)
        list.append(coupon2)
        
        
        list.append(coupon1)
        list.append(coupon2)
        
        list.append(coupon1)
        list.append(coupon2)
        
        list.append(coupon1)
        list.append(coupon2)
        
        list.append(coupon1)
        list.append(coupon2)
        
        
    }
    
    
}
