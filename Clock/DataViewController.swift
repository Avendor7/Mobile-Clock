//
//  DataViewController.swift
//  Clock
//
//  Created by 200220207 on 2015-03-26.
//  Copyright (c) 2015 Stephen Squared. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: AnyObject?

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelAMPM: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateTime()
        var timer = NSTimer()
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        if let obj: AnyObject = dataObject {
//            self.dataLabel!.text = obj.description
//        } else {
//            self.dataLabel!.text = ""
//        }
//    }
    
    func updateTime() {
        var date = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        var hour = components.hour
        var minutes = components.minute
        var seconds = components.second
        labelTime.text = "\(hour):\(minutes):\(seconds)"
        
    }
    
    

}

