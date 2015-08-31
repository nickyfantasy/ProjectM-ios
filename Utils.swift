//
//  File.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if index != nil {
            self.removeAtIndex(index!)
        }
    }
}

extension UIColor {
    class func primaryColor() -> UIColor {
        return UIColor(red:0.94, green:0.42, blue:0.0, alpha:1.0)
    }
    class func buttonColor() -> UIColor {
        return UIColor(red:0.984, green:0.549, blue:0.0, alpha:1.0)
    }
    
    class func highlightCellColor() -> UIColor {
        return UIColor(red:0.9, green:0.9, blue:0.9, alpha:1.0)
    }
}

extension UIView {
    func applyShadow(radius: CGFloat, opacity: Float, xOffset: CGFloat, yOffset: CGFloat, useShadowPath: Bool) {
        self.layer.shadowRadius = radius
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSizeMake(xOffset, yOffset)
        
        if useShadowPath {
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
        } else {
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.mainScreen().scale
        }
    }
    func applyBarShadow() {
        applyShadow(3, opacity: 0.6, xOffset: 0, yOffset: 1, useShadowPath: true)
    }
    func applyCellShadow() {
        applyShadow(1, opacity: 0.2, xOffset: 1, yOffset: 1.5, useShadowPath: true)
        self.backgroundColor = UIColor.whiteColor()
        self.clipsToBounds = false
    }
    func applyButtonStyle() {
        applyShadow(2, opacity: 0.4, xOffset: 1, yOffset: 1, useShadowPath: false)
        self.layer.cornerRadius = 3
        self.backgroundColor = UIColor.buttonColor()
    }
    func resizeToFitSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView as! UIView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
        }
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: width, height: height)
    }
    
    func resizeToFitHeight() {
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView 
            height += aView.frame.height
            NSLog("height = \(height)")
        }
        
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: height)
    }
}

extension UIFont {
    func bold() -> UIFont {
        let descriptor = self.fontDescriptor().fontDescriptorWithSymbolicTraits(UIFontDescriptorSymbolicTraits.TraitBold)
        return UIFont(descriptor: descriptor, size: 0)
    }
}

extension UILabel {
    func applyBoldAsBlack() {
    
    if !MDConfig.isIos8Above {
    self.font = UIFont(name: "Helvetica-Bold", size: self.font.pointSize)
    }
}
}



class Utils {


    static func adjustInsetWithArrow(view: UIButton) {
        let arrowPadding: CGFloat = 16.0 //used to be 16 for old style
        view.titleEdgeInsets = UIEdgeInsetsMake(0, -arrowPadding, 0, arrowPadding)
        view.contentEdgeInsets = UIEdgeInsetsMake(0, arrowPadding, 0, 0)
        
        view.sizeToFit()
    }
    
    
    static func isSmallDeviceWidth() -> Bool{
        return MDConfig.deviceWidth <= 350
    }
    
    
}