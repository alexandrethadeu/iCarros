//
//  RestExtension.swift
//  iCarros
//
//  Created by Alexandre Thadeu Peres da SIlva on 10/16/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension HomeViewController {
 
    func getDados() {
        
        Alamofire.request(self.url, method:.get).responseJSON { response in
            print("------------------------------------------------")
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if var json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            if let json = response.result.value {
                let res = JSON(json)
                let deals = res["deals"].object
                self.deals = deals as! [[String: Any]]
                self.tableRegister()
            }
        
        }
    }
    
}

