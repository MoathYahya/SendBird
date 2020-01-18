//
//  DisplayAlertMessageExtension.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/15/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayAlertViewMessage(title: String, message: String) {
        if !message.isEmpty {
            let alertView = CPAlertVC.create().config(title: title, message: message)
            alertView.show(into: self)
        }
    }
}
