//
//  CouponDetailsController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/8/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class CouponDetailsController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var shortAddress: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var finePrintText: UILabel!
    @IBOutlet weak var businessPage: UIButton!
    
    var couponInfo: CouponInfo!
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.addBarShadow(self.navigationController!.navigationBar)
        
//        self.navigationItem.backBarButtonItem?.title = "Home"
        self.navigationItem.title = couponInfo.storeName
        
        imageView.image = UIImage(named: couponInfo.imageStr)
        couponDescription.text = couponInfo.description
        storeName.text = couponInfo.storeName
        shortAddress.text = couponInfo.addressShort
        
        price.text = "$" + String(format: "%g", couponInfo.price)
        finePrintText.text = couponInfo.finePrintText
        
        let cLayer = businessPage.layer
        cLayer.shadowColor = UIColor.blackColor().CGColor
        cLayer.shadowOpacity = 0.2
        cLayer.shadowRadius = 1
        cLayer.shadowOffset = CGSizeMake(1, 1.5)
        cLayer.cornerRadius = 2
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
