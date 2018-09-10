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
        
        let htIndicator = HTIndicator(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        htIndicator.color = .blue
        htIndicator.startAnimate()
        
        self.view.addSubview(htIndicator)
    }
}

