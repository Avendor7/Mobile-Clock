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

    //Label variables
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelAMPM: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //update the time every second
        updateTime()
        var timer = NSTimer()
        let aSelector : Selector = "updateTime"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    //function for updating the time on the form
    
    func updateTime() {
        var date = NSDate();
        var calendar = NSCalendar.currentCalendar();
        
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitSecond | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date);
        
        var hour = components.hour;
        var minutes = components.minute;
        var month = components.month;
        var year = components.year;
        var day = components.day;
        var seconds = components.second;
        var weekday = components.weekday;
        
        var strWeekday = "";
        var strMonth = "";
        var postfix = "";
        var leading0Min = "";
        var leading0Sec = "";
        var amPM = "";
        
        //determine AM or PM and subract 12 from hour variable
        if (hour > 12){
            labelAMPM.text = "PM";
            hour = hour - 12;
        }else{
            labelAMPM.text = "AM";
        }
        
        //determine leading 0s on minutes and seconds
        if (minutes <= 9){
            leading0Min = "0"
        }else{
            leading0Min = "";
        }
        
        if (seconds <= 9){
            leading0Sec = "0"
        }else{
            leading0Sec = "";
        }
        
        //output hour minutes and seconds
        labelTime.text = "\(hour):" + leading0Min + "\(minutes):" + leading0Sec + "\(seconds)";
        
        //change weekday number into readable string
        switch weekday {
        case 1 :
            strWeekday = "Sunday";
        case 2 :
            strWeekday = "Monday";
        case 3 :
            strWeekday = "Tuesday";
        case 4 :
            strWeekday = "Wednesday";
        case 5 :
            strWeekday = "Thursday";
        case 6 :
            strWeekday = "Friday";
        case 7 :
            strWeekday = "Saturday";
        default:
            strWeekday = "Someday";
        }
        
        // change month of the year into a readable string
        switch month {
        case 1 :
            strMonth = "January";
        case 2 :
            strMonth = "February";
        case 3 :
            strMonth = "March";
        case 4 :
            strMonth = "April";
        case 5 :
            strMonth = "May";
        case 6 :
            strMonth = "June";
        case 7 :
            strMonth = "July";
        case 8 :
            strMonth = "August";
        case 9 :
            strMonth = "September";
        case 10 :
            strMonth = "October";
        case 11 :
            strMonth = "November";
        case 12 :
            strMonth = "December";
        default:
            strMonth = "Undecimber";
        }
        
        //add postfix to the end of the days of the month to make it readable
        switch day {
        case 1 :
            postfix = "st";
        case 21 :
            postfix = "st";
        case 31 :
            postfix = "st";
        case 2 :
            postfix = "nd";
        case 22 :
            postfix = "nd";
        case 3 :
            postfix = "rd";
        case 23 :
            postfix = "rd";
        default:
            postfix = "th";
        }
        
        //output date
        labelDate.text = strWeekday + " " + strMonth + " \(day)" + postfix + ", " + "\(year)";
        
    }
}

