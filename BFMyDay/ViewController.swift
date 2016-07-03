//
//  ViewController.swift
//  BFMyDay
//
//  Created by panbc on 16/6/27.
//  Copyright © 2016年 panbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    @IBOutlet weak var contentTable: UITableView!
    
    let delegateForCategory = DelegateForCategory()
    
    let delegateForContent = DelegateForContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        categoryTable.delegate = delegateForCategory
        categoryTable.dataSource = delegateForCategory
        categoryTable.reloadData()
        
        //        contentTable.delegate = delegateForContent
        contentTable.dataSource = delegateForContent
        contentTable.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    class DelegateForCategory : NSObject, UITableViewDelegate, UITableViewDataSource{
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int{
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            print(String(section))
            return 10
        }
        
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            var cell = tableView.dequeueReusableCellWithIdentifier("category", forIndexPath: indexPath)
            cell.textLabel!.text = "test"
            return cell
        }
    }
    
    class DelegateForContent : NSObject, UITableViewDelegate, UITableViewDataSource{
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int{
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return 10
        }
        
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            var cell = tableView.dequeueReusableCellWithIdentifier("content", forIndexPath: indexPath)
            cell.textLabel!.text = "test"
            return cell
        }
    }
    
    
    
}

