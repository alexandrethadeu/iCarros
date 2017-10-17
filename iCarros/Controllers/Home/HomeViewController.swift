//
//  HomeViewController.swift
//  iCarros
//
//  Created by Alexandre Thadeu Peres da SIlva on 10/16/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //UTILS
    var deals = [[String: Any]]()
    var photos = [String]()
    var pos = Int()
    let url = "https://paginasegura.icarros.com.br/rest/search/deals/est_SP.1-esc_3.1-mar_5.1-ami_2010.1/0/20/1"
    var imgName = String()
    let imgUrl = "http://img0.icarros.com/dbimg/imgadicionalanuncio/2/"
    
    //HEADER
    @IBOutlet weak var searchButton: UIButton!
    
    //BODY
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        bounds()
        getDados()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //HELPERS
    func bounds() {
        searchButton.layer.cornerRadius = 5.0
    }
    
    func tableRegister() {
        let cell = UINib(nibName: "CarCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "CarCell")
        tableView.reloadData()
        self.tableView.layoutIfNeeded()
        tableHeight.constant = tableView.contentSize.height + 3000
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.alpha = 1
            self.loadingView.alpha = 0
        })
    }
    
    //SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetails" {
            let controller = segue.destination as! DetailsViewController
            
            let deal = self.deals[self.pos]
            var imgID = [String]()
            for image in deal["images"] as! [AnyObject] {
                imgID.append(image as! String)
            }
            
            controller.deal = deal
            controller.photos = imgID
            
        }
    }

}
