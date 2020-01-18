//
//  CustomDesign.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/17/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

struct CustomDesign {
    
   static func customView(view: UIView, cornerRadius: CGFloat, shadowColor: UIColor? = nil, shadowRadius: CGFloat? = 0, shadowOpacity: Float? = 0.0) {
           
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowColor = shadowColor?.cgColor
        view.layer.shadowOpacity = shadowOpacity ?? 0.0
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = shadowRadius ?? 0.0
    }
}

