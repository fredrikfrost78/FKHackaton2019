//
//  StegCounterController.swift
//  FK Motion
//
//  Created by Fredrik Frost on 2019-05-16.
//  Copyright © 2019 SuperNova. All rights reserved.
//

import UIKit
import Foundation
import WatchKit
import CoreMotion
import Dispatch

class StepCounterController: UIViewController {
    
    @IBOutlet weak var myPageLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var stairsLabel: UILabel!
    var item: Item!
    
    var distance: Double!
    
    // MARK: - blocks
    /// This block will return steps, distance, averagePage, pace, floor ascended, floor dscended
    public var stepsCountingHandler: ((_ steps: Int, _ distance: Double, _ averagePace : Double, _ pace : Double, _ floorsAscended : Int , _ floorsDscended : Int, _ cadence : Double, _ timeElapsed : Int ) -> Void)?

    
    fileprivate let pedometer = CMPedometer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let calender = Calendar.current
        let weekOfYear = calender.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        myPageLabel.text = "Min sida v "+String(weekOfYear)
        stepLabel.text = ""
        distanceLabel.text = ""
        stairsLabel.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            self.stepLabel.text = "2013"
            self.distanceLabel.text = "28132"
            self.stairsLabel.text = "14"
        }
        
        print(String(CMPedometer.isStepCountingAvailable()));
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 05
        dateComponents.day = 13
        let endDatum = Date()
        guard let fromDatum = calendar.date(from: dateComponents) else { return () }
        
        
    
        pedometer.queryPedometerData(from: fromDatum, to: endDatum) { (pedometerData, error) in
            if error != nil {
                //errorBlock(error!)
            } else if let pedData = pedometerData {
                self.setPedometerData(pedData: pedData)
                //successBlock(self.numberOfSteps, self.distance, self.averagePace, self.pace, self.floorsAscended, self.floorsDscended, self.cadence, endDatum.secondsInBetweenDate(fromDatum))
            }
        }
        
        /*
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
 */
        
        
    }
    
    
    private func setPedometerData(pedData: CMPedometerData)
    {
        self.stepLabel.text = String(Int(truncating: pedData.numberOfSteps))
        
        if let distancee = pedData.distance{
            self.distanceLabel.text = String(round(Double(truncating: distancee)))
        }
        //self.distanceLabel.text = "Distans: "+String(Double(truncating: distancee));
        //self.stairsLabel.text = "Våningar: "+String(Double(truncating: pedData.floorsAscended));
        
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
