//
//  NewDataSource.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/12/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

extension NewVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newModel.books?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath) as! NewBooksCell
        if let book = newModel.books?[indexPath.row] {
            cell.fillData(book)
        }
        return cell
    }
}
