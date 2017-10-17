//
//  DetailsViewController.swift
//  iCarros
//
//  Created by Alexandre Thadeu Peres da SIlva on 10/16/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var deal = [String:Any]()
    var photos = [String]()
    
    let imgUrl = "http://img0.icarros.com/dbimg/imgadicionalanuncio/2/"


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var fuel: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerPhone: UILabel!
    @IBOutlet weak var lasDigit: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dealDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backRootAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func callAction(_ sender: Any) {
       guard let number = URL(string: "tel://\(sellerPhone.text!)") else { return }
       UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
    }
    
    func update () {
        let make = deal["makeDescription"] as! String
        let model = deal["modelDescription"] as! String
        let carName = "\(make) \(model)"
        let carYear = deal["modelYear"] as! String
        let carPrice = Float(deal["price"] as! Int)
        let sallerName = deal["sellerName"] as! String
        let sallerNumber = deal["sellerPhoneNumber"] as! String
        let fuel = deal["fuelDescription"] as! String
        let km = "\(deal["km"] as! Float)km"
        let desc = deal["dealText"] as! String
        let plate = deal["plateLastNumber"] as! String
        let color = deal["colorDescription"] as! String
        let stringPrice = String(format: "%.2f", carPrice).currencyInputFormatting()
        
        self.name.text = "\(carName) \(carYear)"
        self.km.text = km
        self.sellerName.text = sallerName
        self.sellerPhone.text = sallerNumber
        self.lasDigit.text = plate
        self.dealDesc.text = desc
        self.price.text = stringPrice
        self.color.text = color
        self.fuel.text = fuel
        
    }
    
}
