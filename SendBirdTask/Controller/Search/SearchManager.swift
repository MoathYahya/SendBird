//
//  SearchManager.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/14/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension SearchVC: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        let tempNewModel  = Mapper<NewModel>().map(JSON: dicResponse)!
        
        reloadDataInTableView(data: tempNewModel)
    }
    
    func receivedErrorWithMessage(_ message: String) {
        self.displayAlertViewMessage(title: "Error", message: message)
    }
}
