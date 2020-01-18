//
//  NewBooksCell.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/12/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit
import SDWebImage

class NewBooksCell: UITableViewCell {

    @IBOutlet fileprivate weak var containerView   : UIView!
    @IBOutlet fileprivate weak var profileImg      : UIImageView!
    @IBOutlet fileprivate weak var priceLbl        : UILabel!
    @IBOutlet fileprivate weak var subTitleLbl     : UILabel!
    @IBOutlet fileprivate weak var titleLbl        : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        CustomDesign.customView(view: containerView, cornerRadius: 7.0, shadowColor: UIColor.darkGray, shadowRadius: 1.5, shadowOpacity: 1.5)
    }
    
    func fillData(_ data: BooksModel) {
        titleLbl.text     = data.title ?? ""
        subTitleLbl.text  = data.subTitle ?? ""
        priceLbl.text     = data.price ?? ""
        
        profileImg?.sd_setImage(with: URL(string: data.image ?? "") , placeholderImage: UIImage(named: "book"), completed: nil)
    }
}
