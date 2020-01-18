//
//  SearchDataSource.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/14/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

extension SearchVC: UITableViewDataSource, UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        page = 0
        booksModel.removeAll(keepingCapacity: false)
        keyword = searchBar.text ?? ""
        reloadData()
        resultSearchController.isActive = false
        searchBar.resignFirstResponder()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath) as! NewBooksCell
        
        cell.fillData(booksModel[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
          
        guard booksModel.count < totalBooks else {
            return
        }
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchData  {
                reloadData()
            }
        }
    }
}
