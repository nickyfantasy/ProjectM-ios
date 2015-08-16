//
//  File.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation
import UIKit

class Utils {


    static func adjustInsetWithArrow(view: UIButton) {
        let arrowPadding: CGFloat = 16.0 //used to be 16 for old style
        view.titleEdgeInsets = UIEdgeInsetsMake(0, -arrowPadding, 0, arrowPadding)
        view.contentEdgeInsets = UIEdgeInsetsMake(0, arrowPadding, 0, 0)
        
        view.sizeToFit()
    }
    
    static func addBarShadow(barView: UIView) {
        
        let toolbarLayer = barView.layer
        toolbarLayer.shadowRadius = 3
        toolbarLayer.shadowColor = UIColor.blackColor().CGColor
        toolbarLayer.shadowOpacity = 0.6
        toolbarLayer.shadowOffset = CGSizeMake(0, 1)
    }
    
    static func addCardShadow(container: UIView) {
        let cLayer = container.layer;
        cLayer.shadowColor = UIColor.blackColor().CGColor
        cLayer.shadowOpacity = 0.2
        cLayer.shadowRadius = 1
        cLayer.shadowOffset = CGSizeMake(1, 1.5)
        cLayer.shadowPath = UIBezierPath(rect: container.bounds).CGPath
        cLayer.shouldRasterize = true
        cLayer.rasterizationScale = UIScreen.mainScreen().scale
        container.clipsToBounds = false;
        container.backgroundColor = UIColor.whiteColor()
    }
    
    static func isSmallDeviceWidth() -> Bool{
        return MDConfig.deviceWidth <= 350
    }
    
    
}