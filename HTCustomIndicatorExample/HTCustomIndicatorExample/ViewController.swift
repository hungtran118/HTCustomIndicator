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
        
        let htIndicator5 = HTIndicator(frame: CGRect(x: 150, y: 150, width: 60, height: 60), type: .indicator5)
        
        let htIndicator6 = HTIndicator(frame: CGRect(x: 250, y: 150, width: 60, height: 60), type: .indicator6)
        
        let htIndicator7 = HTIndicator(frame: CGRect(x: 50, y: 250, width: 60, height: 60), type: .indicator7)
        
        let htIndicator8 = HTIndicator(frame: CGRect(x: 150, y: 250, width: 60, height: 60), type: .indicator8)
        
        let htIndicator9 = HTIndicator(frame: CGRect(x: 250, y: 250, width: 60, height: 60), type: .indicator9)
        
        let htIndicator10 = HTIndicator(frame: CGRect(x: 50, y: 350, width: 60, height: 60), type: .indicator10)
        
        let htIndicator11 = HTIndicator(frame: CGRect(x: 150, y: 350, width: 60, height: 60), type: .indicator11)
        
        let htIndicator12 = HTIndicator(frame: CGRect(x: 250, y: 350, width: 60, height: 60), type: .indicator12)
        
//        htIndicator1.color = .black
//        htIndicator2.color = .black
//        htIndicator3.color = .black
//        htIndicator4.color = .black
//        htIndicator5.color = .black
//        htIndicator6.color = .black
//        htIndicator7.color = .black
//        htIndicator8.color = .black
//        htIndicator9.color = .black
//        htIndicator10.color = .black
//        htIndicator11.color = .black
//        htIndicator12.color = .black
        
        self.view.addSubview(htIndicator1)
        self.view.addSubview(htIndicator2)
        self.view.addSubview(htIndicator3)
        self.view.addSubview(htIndicator4)
        self.view.addSubview(htIndicator5)
        self.view.addSubview(htIndicator6)
        self.view.addSubview(htIndicator7)
        self.view.addSubview(htIndicator8)
        self.view.addSubview(htIndicator9)
        self.view.addSubview(htIndicator10)
        self.view.addSubview(htIndicator11)
        self.view.addSubview(htIndicator12)
    }
    
    @IBAction func test(_ sender: Any) {
        
        ProgressView.shared.show()
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideProgressView), userInfo: nil, repeats: false)
    }
    
    @objc private func hideProgressView() {
        ProgressView.shared.hide()
    }
}

public class ProgressView {
    
    //MARK:- SUPPORT VARIABLES
    static let shared = ProgressView()
    private let containerView = UIView()
    private let indicator = HTIndicator(frame: CGRect(x: 50, y: 50, width: 60, height: 60), type: .indicator11)
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

















