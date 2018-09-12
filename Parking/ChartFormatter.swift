//
//  ChartFormatter.swift
//  Parking
//
//  Created by Caelan Dailey on 9/12/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Charts
import UIKit


public class ChartFormatter: NSObject, IAxisValueFormatter {
    var workoutDuration = [String]()
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return workoutDuration[Int(value)]
        
    }
    
    public func setValues(values: [String]) {
        self.workoutDuration = values
    }
}
