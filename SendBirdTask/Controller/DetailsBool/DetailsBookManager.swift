//
//  DetailsBookManager.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

extension DetailsBookVC: HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String : Any], tag: Int) {
        bookDetailsModel = Mapper<BookDetailsModel>().map(JSON: dicResponse)!
        fillData(bookDetailsModel)
    }
    
    func receivedErrorWithMessage(_ message: String) {
        self.displayAlertViewMessage(title: "Error", message: message)
    }
}
