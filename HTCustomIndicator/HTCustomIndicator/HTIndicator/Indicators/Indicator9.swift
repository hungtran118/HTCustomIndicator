//
//  Indicator9.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/10/18.
//

import Foundation

class Indicator9: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var dot1 = UIView()
    private var dot2 = UIView()
    private var dot3 = UIView()
    
    private let groupAnimation = CAAnimationGroup()
//    private let xPosAnimation = Animations().xPosAnimation
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = UIColor.clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(dot1)
        self.addSubview(dot2)
        self.addSubview(dot3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        dot1.backgroundColor = self.color
        dot2.backgroundColor = self.color
        dot3.backgroundColor = self.color
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configDot(dot1, index: 0)
        configDot(dot2, index: 1)
        configDot(dot3, index: 2)
    }
    
    private func configDot(_ dot: UIView, index: Int){
        
        let dotSize = self.frame.width / 3
        
        dot.frame = CGRect(x: CGFloat(index) * dotSize, y: (self.frame.width - dotSize) / 2, width: dotSize, height: dotSize)
        dot.backgroundColor = self.color
        dot.layer.cornerRadius = dotSize / 2
        dot.layoutIfNeeded()
    }
    
    override func startAnimate() {
        super.startAnimate()
        
        animate(dot: dot1, index: 0)
        animate(dot: dot3, index: 2)
    }
    
    private func animate(dot: UIView, index: Int) {
        
        dot.layer.removeAllAnimations()
        
        let dotSize = self.frame.width / 3
        
        groupAnimation.duration = 1
        groupAnimation.beginTime = round(10*CACurrentMediaTime())/10 + (index == 0 ? 0 : 0.5)
        groupAnimation.repeatCount = HUGE
        
        let xPosAnimation = Animations().xPosAnimation
        xPosAnimation.fromValue = (index == 0 ? 0.5*dotSize : 2.5*dotSize)
        xPosAnimation.toValue = (index == 0 ? -0.7*dotSize : 3.7*dotSize)
        xPosAnimation.duration = 0.25
        xPosAnimation.autoreverses = true
        xPosAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        groupAnimation.animations = [xPosAnimation]
        groupAnimation.isRemovedOnCompletion = false
        
        dot.layer.add(groupAnimation, forKey: dot.description)
        
    }
}



















