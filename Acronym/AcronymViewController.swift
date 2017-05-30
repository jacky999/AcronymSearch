//
//  ViewController.swift
//  Acronym
//


//import UIKit
//import AFNetworking
//import MBProgressHUD
//

//var url: String = ""
//
//var searchResultList = [String] ()

//class AcronymViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
  // @IBOutlet weak var searchBar: UISearchBar!
    
    
  //  @IBOutlet weak var resultView: UITableView!
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//        if let searchKeyWords = searchBar.text, !searchKeyWords.isEmpty {
//            
//            url = BASE_URL + searchKeyWords
//            
//            let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
//            loadingNotification.mode = MBProgressHUDMode.indeterminate
//            loadingNotification.label.text = "Loading..."
//            
//            DispatchQueue.global(qos: .userInitiated).async {
//                
//                getSearchResults() {
//                    (result: [String]) in
//                    
//                    searchResultList = result
//                    DispatchQueue.main.async {
//                        self.resultView?.reloadData()
//                        loadingNotification.hide(animated: true)
//                    }
//                }
//            }
//        }
//        
//    }

//    override func viewDidLoad() {
//        super.viewDidLoad()

//        resultView.delegate = self
//        resultView.dataSource = self
//        
//        resultView.rowHeight = UITableViewAutomaticDimension
//        resultView.estimatedRowHeight = 60
//        
//        if #available(iOS 9.0, *) {
//            resultView.cellLayoutMarginsFollowReadableWidth = false
//        }
        
//    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searchResultList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as? AcronymTableViewCell{
//            
//            let result = searchResultList[indexPath.row]
//            cell.resultLine.text = result
//            
//            cell.resultLine.numberOfLines = 0
//            cell.resultLine.lineBreakMode = NSLineBreakMode.byWordWrapping
//            
//            return cell
//            
//        } else {
//            return AcronymTableViewCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        var indentationSetting = 0
//        
//        let result = searchResultList[indexPath.row]
//        
//        if result.hasPrefix(PREFIX_1) {
//            indentationSetting = 0
//        }
//        
//        if result.hasPrefix(PREFIX_2) {
//            indentationSetting = 1
//        }
//        
//        if result.hasPrefix(PREFIX_3) {
//            indentationSetting = 2
//        }
//        
//        return indentationSetting
//    }
    
// }

