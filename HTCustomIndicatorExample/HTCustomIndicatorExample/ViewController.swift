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
        
//        htIndicator.color = .blue
        
        let htIndicator2 = HTIndicator()
        htIndicator2.color = .red
        htIndicator2.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
        htIndicator2.indicatorType = .indicator1
        
        self.view.addSubview(htIndicator2)
        
        
    }
}








