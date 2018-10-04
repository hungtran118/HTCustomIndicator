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
        
        let htIndicator1 = HTIndicator(frame: CGRect(x: 50, y: 50, width: 60, height: 60), type: .indicator1)
        
        let htIndicator2 = HTIndicator(frame: CGRect(x: 150, y: 50, width: 60, height: 60))
        htIndicator2.indicatorType = .indicator2
        
        let htIndicator3 = HTIndicator()
        htIndicator3.frame = CGRect(x: 250, y: 50, width: 60, height: 60)
        htIndicator3.indicatorType = .indicator3
        
        self.view.addSubview(htIndicator1)
        self.view.addSubview(htIndicator2)
        self.view.addSubview(htIndicator3)
        
        
        htIndicator1.color = .green
    }
}








