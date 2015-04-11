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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Hello world");
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

