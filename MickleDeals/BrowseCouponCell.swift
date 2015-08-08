//
//  BrowseCouponCell.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/6/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class BrowseCouponCell: UICollectionViewCell {

    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var couponLocation: UILabel!
    @IBOutlet weak var couponPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
//        self.couponImage.frame = CGRectMake(0,0,BrowseViewController.cellHeight, BrowseViewController.cellHeight)
    }

}
