//
//  ViewController.swift
//  TestAssignment
//
//  Created by Akanksha garg on 12/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
       var blogsTableView: UITableView!
       let blogVM = BlogViewModel()
       private let control: UIRefreshControl = UIRefreshControl()
       let estimatedRowHeight = 400.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blogVM.loadData()
        // Do any additional setup after loading the view.
    }


}

