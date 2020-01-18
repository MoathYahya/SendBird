//
//  NewModel.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class NewModel: Mappable {
    
    var error   : String?
    var total   : String?
    var books   : [BooksModel]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        error    <- map["error"]
        total    <- map["total"]
        books    <- map["books"]
    }
    
}
