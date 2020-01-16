//
//  NewManager.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension NewVC: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        newModel  = Mapper<NewModel>().map(JSON: dicResponse)!
        print(newModel)
        tableView.reloadData()

    }
    
    func receivedErrorWithMessage(_ message: String) {
        print(message)
    }
    
    
}
