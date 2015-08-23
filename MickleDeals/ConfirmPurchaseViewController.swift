//
//  ConfirmPurchaseViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/22/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class ConfirmPurchaseViewController: UIViewController {

    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var couponDescription: UILabel!
    
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var couponPrice: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var applyCredit: UILabel!
    @IBOutlet weak var currentCredit: UILabel!
    @IBOutlet weak var purchaseBtn: UIButton!
    
    @IBOutlet weak var whiteCellView: UIView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    var couponInfo: CouponInfo!
    
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func purchaseAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navBar.applyBarShadow()

        whiteCellView.resizeToFitSubviews()
//        whiteCellView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
//        whiteCellView.resizeToFitHeight()
//        whiteCellView.layer.cornerRadius = 3
        whiteCellView.applyShadow(2.52, opacity: 0.25, xOffset: 1.5, yOffset: 2, useShadowPath: MDConfig.isIos8Above ? false : true)
        purchaseBtn.applyButtonStyle()
    purchaseBtn.titleLabel!.applyBoldAsBlack()
        
        storeName.text = couponInfo.storeName
        couponDescription.text = couponInfo.description
        
        let priceStr = "$" + String(format: "%g", couponInfo.price)
        couponPrice.text = priceStr
        applyCredit.text = "-" + priceStr
        currentCredit.text = "Curent Credit: $7"
        totalPrice.text = "$0"
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
