//
//  FilterHeaderView.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/8/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class FilterHeaderView: UICollectionReusableView {

    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBAction func selectCategory(sender: UIButton) {
    }
    
    @IBAction func selectLocation(sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
