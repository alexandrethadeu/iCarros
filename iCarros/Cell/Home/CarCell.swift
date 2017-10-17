//
//  CarCell.swift
//  iCarros
//
//  Created by Alexandre Thadeu Peres da SIlva on 10/16/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation
import UIKit

class CarCell : UITableViewCell {
    let rowHeight = 415
    
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carYear: UILabel!
    @IBOutlet weak var salerName: UILabel!
    @IBOutlet weak var salerPhone: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var gearType: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var type: UILabel!
    
    func updateCell(photo: UIImage, name: String, year: String, salerName: String, salerPhone: String, gear: String, km: String, type: String, price: String) {
        
        self.carImg.image = photo
        self.carName.text = name
        self.carYear.text = year
        self.salerName.text = salerName
        self.salerPhone.text = salerPhone
        self.gearType.text = gear
        self.km.text = km
        self.type.text = type
        self.price.text = price
    }
    
}
