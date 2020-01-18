//
//  BookDetailsModel.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import ObjectMapper

class BookDetailsModel: Mappable {
    /*
     {
         "error": "0"
         "title": "Securing DevOps"
         "subtitle": "Security in the Cloud"
         "authors": "Julien Vehent"
         "publisher": "Manning"
         "isbn10": "1617294136"
         "isbn13": "9781617294136"
         "pages": "384"
         "year": "2018"
         "rating": "5"
         "desc": "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team's highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your cloud ..."
         "price": "$26.98"
         "image": "https://itbook.store/img/books/9781617294136.png"
         "url": "https://itbook.store/books/9781617294136"
         "pdf": {
                   "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                   "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                }
     }
     */
    var error        : String?
    var title        : String?
    var subTitle     : String?
    var authors      : String?
    var publisher    : String?
    var isbn10       : String?
    var isbn13       : String?
    var pages        : String?
    var year         : String?
    var rating       : String?
    var desc         : String?
    var price        : String?
    var image        : String?
    var url          : String?
    var language     : String?
//    var pdf      : [String]?
    
     required convenience init?(map: Map) {
        self.init()
    }

     func mapping(map: Map) {
        error         <- map["error"]
        title         <- map["title"]
        subTitle      <- map["subtitle"]
        authors       <- map["authors"]
        publisher     <- map["publisher"]
        isbn10        <- map["isbn10"]
        isbn13        <- map["isbn13"]
        pages         <- map["pages"]
        year          <- map["year"]
        rating        <- map["rating"]
        desc          <- map["desc"]
        price         <- map["price"]
        image         <- map["image"]
        url           <- map["url"]
        language      <- map["language"]
    }
}
