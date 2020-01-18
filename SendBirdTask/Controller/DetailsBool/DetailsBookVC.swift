//
//  DetailsBookVC.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos

class DetailsBookVC: UIViewController {

    @IBOutlet fileprivate weak var bookImg         : UIImageView!
    @IBOutlet fileprivate weak var titleLbl        : UILabel!
    @IBOutlet fileprivate weak var subtitleLbl     : UILabel!
    @IBOutlet fileprivate weak var priceLbl        : UILabel!
    @IBOutlet fileprivate weak var ratingView      : CosmosView!
    @IBOutlet fileprivate weak var authorLbl       : UILabel!
    @IBOutlet fileprivate weak var publisherLbl    : UILabel!
    @IBOutlet fileprivate weak var pagesLbl        : UILabel!
    @IBOutlet fileprivate weak var yearLbl         : UILabel!
    @IBOutlet fileprivate weak var languageLbl     : UILabel!
    @IBOutlet fileprivate weak var isbn10Lbl       : UILabel!
    @IBOutlet fileprivate weak var isbn13Lbl       : UILabel!
    @IBOutlet fileprivate weak var urlTxt          : UITextView!

    @IBOutlet fileprivate weak var descriptionLbl  : UILabel!

    var isbn  = String()
    
    lazy var http = HTTPController()
    lazy var bookDetailsModel = BookDetailsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(isbn)

        http.delegate = self
        callDetailsApi(isbn)
    }
    
    fileprivate func callDetailsApi(_ isbn: String) {
        http.get(path: APIConstants.baseURl + APIConstants.detailsBookURL + isbn, parameter: [:], tag: 1)
    }

    func fillData(_ data: BookDetailsModel) {
     
        bookImg?.sd_setImage(with: URL(string: data.image ?? "") , placeholderImage: UIImage(named: "book"), completed: nil)
        self.title            = data.title ?? ""
        titleLbl.text         = data.title ?? ""
        subtitleLbl.text      = data.subTitle ?? ""
        priceLbl.text         = data.price ?? ""
        ratingView.rating     = Double(data.rating ?? "") ?? 0.0
        authorLbl.text        = "Authors: \(data.authors ?? "")"
        publisherLbl.text     = "Publisher: \(data.publisher ?? "")"
        pagesLbl.text         = "Pages: \(data.pages ?? "")"
        yearLbl.text          = "Published: \(data.year ?? "")"
        languageLbl.text      = "Language: \(data.language ?? "")"
        isbn10Lbl.text        = "ISBN-10: \(data.isbn10 ?? "")"
        isbn13Lbl.text        = "ISBN-13: \(data.isbn13 ?? "")"

        descriptionLbl.text   = data.desc ?? ""
        
        urlTxt.text = data.url ?? ""
    }
}
