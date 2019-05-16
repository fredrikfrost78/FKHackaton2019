//
//  StegCounterController.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit
import CoreMotion
import WatchKit

class StepCounterController: UIViewController {
    
    @IBOutlet weak var myPageLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var stairsLabel: UILabel!
    var item: Item!
    
    
    // MARK: - blocks
    /// This block will return steps, distance, averagePage, pace, floor ascended, floor dscended
    public var stepsCountingHandler: ((_ steps: Int, _ distance: Double, _ averagePace : Double, _ pace : Double, _ floorsAscended : Int , _ floorsDscended : Int, _ cadence : Double, _ timeElapsed : Int ) -> Void)?

    
    fileprivate let pedometer = CMPedometer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(String(CMPedometer.isStepCountingAvailable()));
        pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
            print("startUpdates")
            if let pedData = pedometerData{
                self.setPedometerData(pedData: pedData)
                /*if self.stepsCountingHandler != nil
                {
                    self.stepsCountingHandler?(self.stepLabel, self.distance, self.averagePace, self.pace, self.floorsAscended, self.floorsDscended, self.cadence , Date().secondsInBetweenDate(self.startDate))
                }*/
            } else {
                self.stepLabel = nil
            }
        })
        
        let calender = Calendar.current
        let weekOfYear = calender.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        myPageLabel.text = "Min sida v."+String(weekOfYear)
        stepLabel.text = "Steg: 1337"
        
        distanceLabel.text = "Distanse: 1200"
        stairsLabel.text = "Trappor: 12"
    }
    
    private func setPedometerData(pedData: CMPedometerData)
    {
        print("Hej")
        print(String(Int(truncating: pedData.numberOfSteps)))
        self.stepLabel.text = String(Int(truncating: pedData.numberOfSteps))
        /*if let distancee = pedData.distance{
            self.distance = Double(truncating: distancee)
        }
        if let averageActivePace = pedData.averageActivePace {
            self.averagePace = Double(truncating: averageActivePace)
        }
        if let currentPace = pedData.currentPace {
            self.pace = Double(truncating: currentPace)
        }
        if let floor = pedData.floorsAscended
        {
            self.floorsAscended = Int(truncating: floor)
        }
        if let floor = pedData.floorsDescended
        {
            self.floorsDscended = Int(truncating: floor)
        }
        if let cadence = pedData.currentCadence
        {
            self.cadence = Double(truncating: cadence)
        }*/
    }
}
