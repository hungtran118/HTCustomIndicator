//
//  ViewController.swift
//  HTCustomIndicatorExample
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import UIKit
import HTCustomIndicator

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let htIndicator1 = HTIndicator()
        htIndicator1.frame = CGRect(x: 100, y: 100, width: 60, height: 60)
        htIndicator1.indicatorType = .indicator1
        
        let htIndicator2 = HTIndicator()
        htIndicator2.frame = CGRect(x: 200, y: 100, width: 60, height: 60)
        htIndicator2.indicatorType = .indicator2
        
        self.view.addSubview(htIndicator1)
        self.view.addSubview(htIndicator2)
        
    }
}








