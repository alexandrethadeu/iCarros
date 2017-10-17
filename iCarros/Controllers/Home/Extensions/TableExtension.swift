//
//  TableExtension.swift
//  iCarros
//
//  Created by Alexandre Thadeu Peres da SIlva on 10/16/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 415.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.deals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        let car = deals[indexPath.row]
        
        let make = car["makeDescription"] as! String
        let model = car["modelDescription"] as! String
        let carName = "\(make) \(model)"
        let carYear = car["modelYear"] as! String
        let carPrice = Float(car["price"] as! Int)
        let sallerName = car["sellerName"] as! String
        let sallerNumber = car["sellerPhoneNumber"] as! String
        let gear = car["gearDescription"] as! String
        let fuel = car["fuelDescription"] as! String
        let km = "\(car["km"] as! Float)km"
        var imgID = [String]()
        for image in car["images"] as! [AnyObject] {
            imgID.append(image as! String)
        }
        let cover = self.imgUrl + imgID[0]
        
        let image = downloadFileSync(cover)
        let stringPrice = String(format: "%.2f", carPrice).currencyInputFormatting()
        
        cell.updateCell(photo: image!, name: carName, year: carYear, salerName: sallerName, salerPhone: sallerNumber, gear: gear, km: km, type: fuel.lowercased(), price: stringPrice)
        
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pos = indexPath.row
        performSegue(withIdentifier: "goDetails", sender: self)
    }
    
}
