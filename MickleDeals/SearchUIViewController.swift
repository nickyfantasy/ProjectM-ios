//
//  SearchUIViewController.swift
//  MickleDeals
//
//  Created by Chan, Nicky on 8/16/15.
//  Copyright © 2015 Chan, Nicky. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class SearchUIViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    private var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Categories, Coupons..."
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.titleView = searchController.searchBar

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
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
