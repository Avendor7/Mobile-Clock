//
//  DataViewController.swift
//  Clock
//
//  Created by 200220207 on 2015-03-26.
//  Copyright (c) 2015 Stephen Squared. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: AnyObject?
    
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelLap: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonLap: UIButton!
    
    var milliseconds = 0;
    var seconds = 0;
    var minutes = 0;
    var leading0Min = "";
    var leading0Sec = "";
    var leading0MilSec = "";
    var timerStr = "";
    var startStopToggle = 0;
    var timer = NSTimer();
    
    func timerUpdate() {
        //keep track of the time and formatting the minutes, milliseconds, and seconds
        milliseconds++;
        if (milliseconds == 60){
            seconds++;
            milliseconds = 0;
            if (seconds == 60){
                minutes++;
                seconds = 0;
                if (minutes == 60){
                    minutes = 0;
                    seconds = 0;
                    milliseconds = 0;
                }
            }
        }
        
        //determine leading 0s on minutes, milliseconds, and seconds
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
        if (milliseconds <= 9){
            leading0MilSec = "0"
        }else{
            leading0MilSec = "";
        }
        
        //output to label
        timerStr = leading0Min + "\(minutes):" + leading0Sec + "\(seconds):" + leading0MilSec + "\(milliseconds)";
        labelTime.text = timerStr;
    }
    
    
    @IBAction func buttonStart(sender: AnyObject) {
        
        //simulate toggle button
        
        //if started
        if (startStopToggle == 0){
            buttonStart.setTitle("Stop", forState: UIControlState.Normal);
            startStopToggle = 1;
            startTimer();
            buttonReset.enabled = true;
            buttonLap.enabled = true;
        //if stopped
        }else if(startStopToggle == 1){
            buttonStart.setTitle("Start", forState: UIControlState.Normal);
            startStopToggle = 0;
            minutes = 0;
            seconds = 0;
            milliseconds = 0;
            labelLap.text = "00:00:00";
            buttonReset.enabled = false;
            buttonLap.enabled = false;
            timer.invalidate();
        }
        
    }
    
    //starts the timer if not already started
    func startTimer(){
                if !timer.valid {
            let aSelector : Selector = "timerUpdate"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true);
        }
    }
    //reset button press
    @IBAction func buttonReset(sender: AnyObject) {
        minutes = 0;
        seconds = 0;
        milliseconds = 0;
        
    }
    //lap button pressed
    @IBAction func buttonLap(sender: AnyObject) {
        labelLap.text = timerStr;
    }
    //onload disable the lap and reset buttons
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonReset.enabled = false;
        buttonLap.enabled = false;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

