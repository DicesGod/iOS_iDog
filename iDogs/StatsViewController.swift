//
//  StatsViewController.swift
//  iDogs
//
//  Created by Minh Le on 2019-06-27.
//  Copyright © 2019 Minh Le. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var count = 0
    
    
    @IBOutlet weak var poodleCount: UILabel!
    
    @IBOutlet weak var germanCount: UILabel!
    
    
    @IBOutlet weak var goldenCount: UILabel!
    
    
    @IBOutlet weak var dachshundCount: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        count = ((userInteractionDao?.getDog(breed: "Poddle"))!)
        poodleCount.text = String(count)
        //print(userInteractionDao?.getDog(breed: "Poddle") ?? 12)
        
        count = ((userInteractionDao?.getDog(breed: "German Shepherd"))!)
        germanCount.text = String(count)
        
        count = ((userInteractionDao?.getDog(breed: "Golden Retriever"))!)
        goldenCount.text = String(count)
        
        count = ((userInteractionDao?.getDog(breed: "Dachshund"))!)
        dachshundCount.text = String(count)
    }
    


}
