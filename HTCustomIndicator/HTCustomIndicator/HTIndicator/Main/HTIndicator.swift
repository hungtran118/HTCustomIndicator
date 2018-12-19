//
//  CustomIndicator.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import Foundation
import UIKit

public class HTIndicator: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isStarted: Bool = false
    
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
    
    public override var center: CGPoint {
        didSet {
            indicator.frame = CGRect(x: 0, y: 0, width: min(frame.width, frame.height), height: min(frame.width, frame.height))
            indicator.setFrame()
        }
    }
    
    //MARK:- Init
    
    //Create base indicator class
    var indicator: BaseIndicator = BaseIndicator()
    
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
        case .indicator2:
            indicator = Indicator2(frame: prettyFrame)
        case .indicator3:
            indicator = Indicator3(frame: prettyFrame)
        case .indicator4:
            indicator = Indicator4(frame: prettyFrame)
        case .indicator5:
            indicator = Indicator5(frame: prettyFrame)
        case .indicator6:
            indicator = Indicator6(frame: prettyFrame)
        case .indicator7:
            indicator = Indicator7(frame: prettyFrame)
        case .indicator8:
            indicator = Indicator8(frame: prettyFrame)
        case .indicator9:
            indicator = Indicator9(frame: prettyFrame)
        case .indicator10:
            indicator = Indicator10(frame: prettyFrame)
        case .indicator11:
            indicator = Indicator11(frame: prettyFrame)
        case .indicator12:
            indicator = Indicator12(frame: prettyFrame)
        }
    }
}



















