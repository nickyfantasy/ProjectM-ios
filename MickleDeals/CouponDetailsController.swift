//
//  CouponDetailsController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/8/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class CouponDetailsController: UIViewController, MDLoginCallback {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var couponDescription: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var shortAddress: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var finePrintText: UILabel!
    @IBOutlet weak var businessPage: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    @IBAction func buyAction(sender: AnyObject) {
        
        MDLoginManager.loginIfNecessary(self, callback: self)
    }
    
    var couponInfo: CouponInfo!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addBarShadow()
    }
    
    func addBarShadow() {
        
        self.navigationController!.navigationBar.applyBarShadow()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("addBarShadow"), userInfo: nil, repeats: false)
        
//        self.navigationItem.backBarButtonItem?.title = "Home"
        self.navigationItem.title = couponInfo.storeName
        
        imageView.image = UIImage(named: couponInfo.imageStr)
        couponDescription.text = couponInfo.description
        storeName.text = couponInfo.storeName
        shortAddress.text = couponInfo.addressShort
        
        let priceStr = "$" + String(format: "%g", couponInfo.price)
        price.text = priceStr
        finePrintText.text = couponInfo.finePrintText
        
        businessPage.applyShadow(1, opacity: 0.4, xOffset: 1, yOffset: 1, useShadowPath: false)
        
        buyButton.setTitle("Get this Coupon for \(priceStr)", forState: .Normal)
        buyButton.applyButtonStyle()
        buyButton.titleLabel!.applyBoldAsBlack()
        
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
    
    func onLoginSuccess() {
        
        let confirmPurchaseVC = self.storyboard?.instantiateViewControllerWithIdentifier("ConfirmPurchase") as! ConfirmPurchaseViewController
        confirmPurchaseVC.couponInfo = couponInfo
        presentViewController(confirmPurchaseVC, animated: true, completion: nil)
    }

}
