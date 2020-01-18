//
//  HTTPController.swift
//  SendBirdTask
//
//  Created by Moath Yahia on 1/13/20.
//  Copyright © 2020 Moath Yahia. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SystemConfiguration
import PKHUD

protocol HttpControllerDelegate {
    func receivedResponseArray(_ dicResponse: [String: Any], tag: Int)
    func receivedErrorWithMessage(_ message: String)
}

class HTTPController  {
    
    var delegate: HttpControllerDelegate?
    
    private let noNetworkMsg: String = "Please check your internet connection or try again later"
    private let somethingWrong: String = "Something error please try again"
    
    
    func get(path: String, parameter: Parameters, tag: Int) {
        print("full url: \(path) \(parameter)")
        
        if !Reachability.isConnectedToNetwork() {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.displayAlertViewMessage(title: "Network Error", message: noNetworkMsg)
            }
            return
        }
        HUD.show(.progress)

        Alamofire.request(path, method: .get, parameters: parameter).validate().responseJSON { response in
            HUD.hide()
            switch response.result {
            case .success(_):
                if let valueArray = response.value as? [String: Any] {
                    self.delegate?.receivedResponseArray(valueArray, tag: tag)
                    return
                }
            case .failure(_):
                self.delegate?.receivedErrorWithMessage(self.somethingWrong)
            }
        }
    }
}
