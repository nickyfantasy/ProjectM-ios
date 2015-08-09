//
//  CouponDetailsController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/8/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class CouponDetailsController: UIViewController {
    
    var couponInfo: CouponInfo!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = couponInfo.storeName
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
