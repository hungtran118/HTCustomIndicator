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
        
        //Usage 1
        let htIndicator1 = HTIndicator(frame: CGRect(x: 50, y: 50, width: 60, height: 60), type: .indicator1)
        
        //Usage 2
        let htIndicator2 = HTIndicator(frame: CGRect(x: 150, y: 50, width: 60, height: 60))
        htIndicator2.indicatorType = .indicator2
        
        //Usage 3
        let htIndicator3 = HTIndicator()
        htIndicator3.frame = CGRect(x: 250, y: 50, width: 60, height: 60)
        htIndicator3.indicatorType = .indicator3
        
        let htIndicator4 = HTIndicator(frame: CGRect(x: 50, y: 150, width: 60, height: 60), type: .indicator4)
        
        self.view.addSubview(htIndicator1)
        self.view.addSubview(htIndicator2)
        self.view.addSubview(htIndicator3)
        self.view.addSubview(htIndicator4)
    }
    
    @IBAction func test(_ sender: Any) {
        
        ProgressView.shared.show()
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
                ProgressView.shared.hide()
            }
        }
    }
}

class ProgressView {
    
    //MARK:- SUPPORT VARIABLES
    static let shared = ProgressView()
    private let containerView = UIView()
    private let indicator = HTIndicator(frame: CGRect(x: 50, y: 50, width: 60, height: 60), type: .indicator1)
    private var isShowing = false
    
    //MARK: - Main functions
    private init() {}
    
    func show() {
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        if !isShowing {
            
            isShowing = true
            
            containerView.frame = keyWindow.frame
            containerView.center = keyWindow.center
            containerView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            
            indicator.center = containerView.center
            containerView.addSubview(indicator)
            
            keyWindow.addSubview(containerView)
        }
    }
    
    func hide() {
        isShowing = false
        indicator.removeFromSuperview()
        containerView.removeFromSuperview()
    }
}

















