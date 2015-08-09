//
//  BrowseViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDataSource {
    
    static let cellMargin: CGFloat = 6
    static let cellHeight: CGFloat = 70
    
    private var dataList = DataListModel.instance.list
    private let reuseIdentifier = "BrowseCouponCell"
    private let sectionInsets = UIEdgeInsets(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
    //private var formatter = NSNumberFormatter()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let image = UIImage(named: "full_logo.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        //formatter.numberStyle = .CurrencyStyle
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataList.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BrowseCouponCell
    
//        cell.layer.cornerRadius = 8
//        cell.layer.borderColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1.0).CGColor
//        cell.layer.borderWidth = 0.4
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 1
        cell.layer.shadowOffset = CGSizeMake(1, 2)
        cell.clipsToBounds = false;
        
        
        
        cell.backgroundColor = UIColor.whiteColor()
        // Configure the cell
        
        let couponInfo = dataList[indexPath.row]
        //3
        
        let couponImage = UIImage(named: couponInfo.imageSmallStr)
        cell.couponImage.image = couponImage
        cell.couponDescription.text = couponInfo.description
        cell.couponLocation.text = couponInfo.storeName
        
        
        cell.couponPrice.text = "$" + String(format: "%g", couponInfo.price)
    
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "FilterHeaderView", forIndexPath: indexPath) as! FilterHeaderView
        
        return reusableView
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let totalWidth = collectionView.frame.width;
            
            return CGSize(width: totalWidth - BrowseViewController.cellMargin * 2, height: BrowseViewController.cellHeight )
    }
    
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return BrowseViewController.cellMargin
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = collectionView?.indexPathForCell(sender as! UICollectionViewCell)!
        let detailsVC = segue.destinationViewController as! CouponDetailsController
        
        detailsVC.couponInfo = dataList[indexPath!.row]
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}


