//
//  AcronymSearchVC.swift
//  Acronym
//
//  Created by Jack on 5/21/17.
//  Copyright © 2017 AMT. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD


var url: String = ""
var searchResultList = [String] ()
var acronymSearch = AcronymSearch()


extension String {
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}

class AcronymSearchVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var acronymSearchView: UIView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        if let searchKeyWords = searchBar.text {
            
            if searchKeyWords.isAlphanumeric == true {
                
                let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
                loadingNotification.mode = MBProgressHUDMode.indeterminate
                loadingNotification.label.text = "Loading..."
                
                acronymSearch.getSearchResults(keyword: searchKeyWords) {
                    
                    (result: [String]) in
                    
                    if result.count != 0 {
                        let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "AcronymTableViewController") as! AcronymTableViewController
                        
                        destinationController.searchResultTitle = ACRONYM + searchKeyWords
                        destinationController.searchResultList = result
                        
                        self.navigationController?.pushViewController(destinationController, animated: true)
                        
                        DispatchQueue.main.async {
                            loadingNotification.hide(animated: true)
                            
                        }
                    }
                }
                
                self.view.endEditing(true)
            }
        }
        
    }
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        searchBar.delegate = self
        self.navigationController?.navigationBar.topItem?.title = "Main"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
