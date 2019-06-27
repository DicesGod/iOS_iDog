//
//  ViewController.swift
//  iDogs
//
//  Created by Minh Le on 2019-06-27.
//  Copyright © 2019 Minh Le. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet weak var lifespanLabel: UILabel!
    
    var lifespanText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifespanLabel.text = lifespanText
    }


}

