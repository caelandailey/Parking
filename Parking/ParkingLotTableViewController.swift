//
//  ParkingLotTableViewController.swift
//  Parking
//
//  Created by Caelan Dailey on 9/12/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import UIKit

class ParkingLotTableViewController: UITableViewController {
    
    private static var cellReuseIdentifier = "ParkingLotTableViewController.DatasetItemsCellIdentifier"
    
    let delegateID: String = UIDevice.current.identifierForVendor!.uuidString
    
    // Update on main thread
    func datasetUpdated() {
        DispatchQueue.main.async(){
            self.tableView.reloadData()
            self.tableView.setNeedsDisplay()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datasetUpdated()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ParkingLotTableViewController.cellReuseIdentifier)
      
        
        self.title = "Parking Lots"
    }
    
    @objc func updateTable(sender: UIButton) {
        datasetUpdated()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tableView == self.tableView, section == 0 else {
            return 0
        }
        return 3
    }
    
    // THIS CREATES THE CELLS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableView === self.tableView, indexPath.section == 0 else {
            return UITableViewCell()
        }
       let cell: UITableViewCell = UITableViewCell()
        
        let lotName = UILabel()
        lotName.text = "Merrill Lot"
        lotName.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        lotName.textAlignment = .center
    
        lotName.font = UIFont.boldSystemFont(ofSize: 40)
        
        
        let percentLabel = UILabel()
        percentLabel.text = "80%"
        percentLabel.textAlignment = .center
        percentLabel.backgroundColor = UIColor.yellow
        percentLabel.frame = CGRect(x: cell.frame.width/6, y: cell.frame.width/3, width: cell.frame.width/3, height: cell.frame.width/3)
        
        let height = self.view.frame.size.height/3
        let barChart = PlainBarChart(frame: CGRect(x: self.view.frame.width/2, y: 80, width: self.view.frame.width/2, height: height-80))
        
     
        
        barChart.workoutDuration = ["8AM","9AM","10AM","11AM","12PM","1PM","2PM","3PM","4PM","5PM"]
        barChart.beatsPerMinute = ["50","66","170","260","300","292","250","220","180","126"]
        barChart.barChartSetup()
        cell.addSubview(barChart)
        

        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        cell.addSubview(lotName)
        cell.addSubview(percentLabel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/3
    }

    // GO TO GAME
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView === self.tableView, indexPath.section == 0 else {
            return
        }
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}
