//
//  StegCounterController.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit

class StepCounterController: UIViewController {
    
    @IBOutlet weak var myPageLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var stairsLabel: UILabel!
    var item: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let calender = Calendar.current
        let weekOfYear = calender.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        myPageLabel.text = "Min sida v."+String(weekOfYear)
        stepLabel.text = "Steg: 1337"
        
        distanceLabel.text = "Distanse: 1200"
        stairsLabel.text = "Trappor: 12"
    }
}
