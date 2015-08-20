//
//  MyCouponViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/2/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

class MyCouponViewController: UICollectionViewController {

        static let cellMargin: CGFloat = 6
        static let cellHeight: CGFloat = 70
        
        private var dataList = [CouponInfo]()
        private let reuseIdentifier = "BrowseCouponCell"
        private let sectionInsets = UIEdgeInsets(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.clearsSelectionOnViewWillAppear = true
            
            dataList.append(DataListModel.instance.list[0])
            dataList.append(DataListModel.instance.list[1])
        }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        Utils.addBarShadow(self.navigationController!.navigationBar)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
//        self.navigationController?.navigationBar.layer.shadowRadius = 0
//        self.navigationController?.navigationBar.layer.shadowOffset = CGSizeMake(0, 0)
    }
        
        
        
        // MARK: UICollectionViewDataSource
        
        override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 2
        }
        
        
        override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }
        
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BrowseCouponCell
            
            Utils.addCardShadow(cell)
            // Configure the cell
            
            let couponInfo = dataList[indexPath.section]
            
            let couponImage = UIImage(named: couponInfo.imageSmallStr)
            cell.couponImage.image = couponImage
            cell.couponDescription.text = couponInfo.description
            cell.couponLocation.text = couponInfo.storeName
            
            
            cell.couponPrice.text = "$" + String(format: "%g", couponInfo.price)
            
            
            let selectedBgView = UIView(frame: cell.frame)
            selectedBgView.backgroundColor = Constants.highlightCellColor
            cell.selectedBackgroundView = selectedBgView
            return cell
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
            
            if let cell = sender as? UICollectionViewCell {
                
                let indexPath = collectionView?.indexPathForCell(cell)
                let detailsVC = segue.destinationViewController as! CouponDetailsController
                
                detailsVC.couponInfo = dataList[indexPath!.section]
            }
            
        }
    
//        override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
//            
//            collectionView.cellForItemAtIndexPath(indexPath)?.contentView.backgroundColor = Constants.highlightCellColor
//            
//        }
//        
//        
//        override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
//            collectionView.cellForItemAtIndexPath(indexPath)?.contentView.backgroundColor = UIColor.whiteColor()
//        }
    
    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
//            switch kind {
//                //2
//            case UICollectionElementKindSectionHeader:
                //3
                let headerView =
                collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                    withReuseIdentifier: "MyCouponHeaderView",
                    forIndexPath: indexPath)
                    as! MyCouponHeaderView
                let headerText: String
                if indexPath.section == 0 {
                    headerText = "Available"
                } else if indexPath.section == 1 {
                    headerText = "Used"
                } else {
                    headerText = ""
                }
                headerView.label.text = headerText
                return headerView
//            default:
//                //4
//                assert(false, "Unexpected element kind")
//            }
    }
    


}
