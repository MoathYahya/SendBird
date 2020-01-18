//
//  SearchVC.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/12/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    lazy var http = HTTPController()
    lazy var booksModel: [BooksModel] = [BooksModel]()
    var resultSearchController = UISearchController()
    var page = 0
    var fetchData = false
    var totalBooks = Int()
    var keyword = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        http.delegate = self
        setupCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Search"
    }
    
    func setupCells() {
        tableView.register(UINib(nibName: "NewBooksCell", bundle: nil), forCellReuseIdentifier: "NewBookCell")
        tableView.estimatedRowHeight = 150
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            controller.searchBar.tintColor = UIColor.green
            tableView.tableHeaderView = controller.searchBar
            return controller
        })()        
    }
    
    func reloadData() {
        fetchData = true
        page += 1
        http.get(path: APIConstants.baseURl + APIConstants.searchURL + keyword + "/\(page)" , parameter: [:], tag: 1)
    }
    
    func reloadDataInTableView(data: NewModel) {
        
        totalBooks = Int(data.total ?? "") ?? 0
        if let temp = data.books {
            booksModel += temp
        }
        tableView.reloadData()
        fetchData = false
    }

}
