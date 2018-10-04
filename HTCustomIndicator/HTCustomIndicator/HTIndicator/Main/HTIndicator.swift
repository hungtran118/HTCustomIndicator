//
//  CustomIndicator.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import Foundation

public class HTIndicator: UIView {
    
    //MARK:- SUPPORT VARIABLES
    var isStarted: Bool = false
    
    //MARK:- Custom
    
    public var indicatorType = HTIndicatorType.indicator1 {
        didSet {
            isStarted = false
            indicator.removeFromSuperview()
            startAnimate()
            indicator.color = self.color
            indicator.setColor()
        }
    }
    
    public var color = UIColor.white {
        didSet {
            indicator.color = self.color
            indicator.setColor()
        }
    }
    
    public override var frame: CGRect {
        didSet {
            indicator.frame = CGRect(x: 0, y: 0, width: min(frame.width, frame.height), height: min(frame.width, frame.height))
            indicator.setFrame()
        }
    }
    
    //MARK:- Init
    
    //Create base indicator class
    var indicator = BaseIndicator()
    
    //Instance normally
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        startAnimate()
    }
    
    //Instance with type
    public init(frame: CGRect, type: HTIndicatorType) {
        super.init(frame: frame)
        
        self.indicatorType = type
        startAnimate()
    }
    
    //Instance coder
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        startAnimate()
    }
    
    private func startAnimate() {
        
        guard !isStarted else { return }
        
        checkIndicatorType()
        
        self.addSubview(indicator)
        indicator.startAnimate()
        isStarted = true
    }
    
    private func checkIndicatorType() {
        
        let prettyFrame = CGRect(x: 0, y: 0, width: min(frame.width, frame.height), height: min(frame.width, frame.height))
        
        switch indicatorType {
        case .indicator1:
            indicator = Indicator1(frame: prettyFrame)
        default:
            indicator = Indicator1(frame: prettyFrame)
        }
    }
}


















