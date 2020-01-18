//
//  NewDelegate.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/12/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

extension NewVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailsBookVC") as! DetailsBookVC

        if let book = newModel.books?[indexPath.row] {
            controller.isbn = book.isbn13 ?? ""
        }
        self.navigationController?.pushViewController(controller,animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
