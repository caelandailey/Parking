//
//  ViewController.swift
//  Parking
//
//  Created by Caelan Dailey on 8/28/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import UIKit
import Charts

protocol GetChartData {
    func getChartData(with dataPoints: [String], values: [String])
    var workoutDuration: [String] {get set}
    var beatsPerMinute: [String] {get set}
    
}
class ViewController: UIViewController, GetChartData {
 
    var workoutDuration = [String]()
    var beatsPerMinute = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateChartData()
        
        barChart()
 
    }


    func populateChartData() {
        workoutDuration = ["8AM","9AM","10AM","11AM","12PM","1PM","2PM","3PM","4PM","5PM"]
        beatsPerMinute = ["50","66","170","260","300","292","250","220","180","126"]
        self.getChartData(with: workoutDuration, values: beatsPerMinute)
    }
    
    func barChart() {
        let barChart = BarChart(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        barChart.delegate = self
        self.view.addSubview(barChart)
    }

    func getChartData(with dataPoints: [String], values: [String]) {
        self.workoutDuration = dataPoints
        self.beatsPerMinute = values
    }

}


