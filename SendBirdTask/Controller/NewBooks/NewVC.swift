//
//  NewVC.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/12/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

class NewVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var http = HTTPController()
    lazy var newModel: NewModel = NewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCells()
        
        http.delegate = self
        fetchData()
    }
    
    func setupCells() {

        tableView.register(UINib(nibName: "NewBooksCell", bundle: nil), forCellReuseIdentifier: "NewBookCell")
        tableView.estimatedRowHeight = 150
    }
    
    
    func fetchData() {
        http.get(path: APIConstants.baseURl + APIConstants.newURL, parameter: [:], tag: 1)
    }

}
