//
//  BooksModel.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class BooksModel: Mappable {
    
    var image    : String?
    var isbn13   : String?
    var price    : String?
    var subTitle : String?
    var title    : String?
    var url      : String?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        image      <- map["image"]
        isbn13     <- map["isbn13"]
        price      <- map["price"]
        subTitle   <- map["subtitle"]
        title      <- map["title"]
        url        <- map["url"]
    }
}
