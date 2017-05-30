//
//  AcronymTableViewController.swift
//  Acronym
//
//  Created by Jack on 5/21/17.
//  Copyright © 2017 AMT. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class AcronymTableViewController: UITableViewController {
    
    var searchResultTitle : String?
    var searchResultList : [String]?
    
    
    @IBOutlet var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "water"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        if #available(iOS 9.0, *) {
            tableView.cellLayoutMarginsFollowReadableWidth = false
        }
        
        if !((searchResultTitle?.isEmpty)!) {
            self.navigationItem.title = searchResultTitle
        }
        if !((searchResultList?.isEmpty)!) {
            self.searchResultTableView.reloadData()
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (searchResultList?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AcronymTableViewCell{
            
            let result = searchResultList?[indexPath.row]
            cell.resultLine.text = result
            cell.resultLine.numberOfLines = 0
            cell.resultLine.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            return cell
            
        } else {
            return AcronymTableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        var indentationSetting = 0
        
        let result = searchResultList?[indexPath.row]
        
        if (result?.hasPrefix(PREFIX_1))! {
            indentationSetting = 0
        }
        if (result?.hasPrefix(PREFIX_2))! {
            indentationSetting = 2
        }
        if (result?.hasPrefix(PREFIX_3))! {
            indentationSetting = 4
        }
        
        return indentationSetting
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dismiss(animated: true, completion: nil)
        _ = self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}




