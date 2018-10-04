//
//  CustomIndicator.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import Foundation

public class BaseIndicator: UIView {
    
    //MARK:- SUPPORT VARIABLES
    
    //MARK:- Custom color
    
    public var color = UIColor.white
    
    //MARK:- Init
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        self.backgroundColor = UIColor.clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    func setColor() {}
    func setFrame() {}
    
    public func toBaseState() {}
    
    func configStick(_ stick: UIView, index: Int) {}
    
    public func startAnimate() {}
    
    func animate(view: UIView, duration: Double) {}
}



















