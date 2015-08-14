//
//  BrowseViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/3/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit


class BrowseViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDataSource, UIPopoverControllerDelegate {
    
    static let cellMargin: CGFloat = 6
    static let cellHeight: CGFloat = 70
    
    private var dataList = DataListModel.instance.list
    private let reuseIdentifier = "BrowseCouponCell"
    private let sectionInsets = UIEdgeInsets(top: cellMargin, left: cellMargin, bottom: cellMargin, right: cellMargin)
    //private var formatter = NSNumberFormatter()
    
    private var filterPopoverController: UIPopoverController?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterToolBar: UIToolbar!
    
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var sortBtn: UIBarButtonItem!
    @IBOutlet weak var notificationBtn: UIBarButtonItem!
    
    
//    @IBAction func notificationClick(sender: UIBarButtonItem) {
//        
//        
//        
////        let filterListController = FilterListController()
////        presentViewController(filterListController, animated: true, completion: nil)
//    }
//    
//    @IBAction func selectFilter(sender: UIButton) {
//        
//        
//        
////        toggleFilterPopover(sender, popupType: sender.tag)
//    }
    
    
    func toggleFilterPopover(inView: UIView, popupType: Int) {
        if filterPopoverController == nil {
            let filterListController = FilterListController()
            filterListController.browseViewController = self
            filterPopoverController = UIPopoverController(contentViewController: filterListController)
            filterPopoverController?.presentPopoverFromRect(inView.frame, inView: inView, permittedArrowDirections: .Any, animated: true)
            
        } else {
            filterPopoverController?.dismissPopoverAnimated(true)
            filterPopoverController = nil
        }
    }
    
    func popoverControllerDidDismissPopover(popoverController: UIPopoverController) {
        if popoverController == filterPopoverController {
            filterPopoverController = nil
        }
    }
    
    func onFilterSelected(selectedStr: String, popupType: Int) {
        if filterPopoverController != nil {
            filterPopoverController?.dismissPopoverAnimated(true)
            filterPopoverController = nil
        }
        
        sendRequest()
    }
    
    func sendRequest() {
        //send request
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let image = UIImage(named: "full_logo.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        Utils.addBarShadow(filterToolBar)
        Utils.adjustInsetWithArrow(categoryBtn)
        Utils.adjustInsetWithArrow(locationBtn)
        //formatter.numberStyle = .CurrencyStyle
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }



    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BrowseCouponCell
    
        Utils.addCardShadow(cell)
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
            
            detailsVC.couponInfo = dataList[indexPath!.row]
        } else {
            
            let filterListVC = segue.destinationViewController as! FilterListController
            let filterTitle: String
            switch sender!.tag {
                case 1:
                filterTitle = "Notification"
            case 2:
                filterTitle = "Sort"
            case 3:
                filterTitle = "Select Category"
            case 4:
                filterTitle = "Select Location"
            default:
                filterTitle = ""
            }
            filterListVC.title = filterTitle
        }
        
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


