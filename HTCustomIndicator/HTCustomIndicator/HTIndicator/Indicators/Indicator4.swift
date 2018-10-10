//
//  Indicator4.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/8/18.
//

import Foundation

class Indicator4: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var dot1 = UIView()
    private var dot2 = UIView()
    private var dot3 = UIView()
    private var dot4 = UIView()
    private var dot5 = UIView()
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = UIColor.clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(dot1)
        self.addSubview(dot2)
        self.addSubview(dot3)
        self.addSubview(dot4)
        self.addSubview(dot5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        dot1.backgroundColor = self.color
        dot2.backgroundColor = self.color
        dot3.backgroundColor = self.color
        dot4.backgroundColor = self.color
        dot5.backgroundColor = self.color
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
        configDot(dot4, index: 3)
        configDot(dot5, index: 4)
    }
    
    private func configDot(_ dot: UIView, index: Int) {
        
        let dotSize = self.frame.width / 5
        let size = dotSize - (CGFloat(4 - index) * (dotSize / 4))
        
        dot.frame = CGRect(x: (frame.size.width - size) / 2, y: (dotSize - size) / 2, width: size, height: size)
        dot.layer.cornerRadius = size / 2
        dot.layoutIfNeeded()
    }
    
    override func startAnimate() {
        super.startAnimate()
        
        animate(dot: dot1, index: 0)
        animate(dot: dot2, index: 1)
        animate(dot: dot3, index: 2)
        animate(dot: dot4, index: 3)
        animate(dot: dot5, index: 4)
    }
    
    private func animate(dot: UIView, index: CGFloat) {
        
        dot.layer.removeAllAnimations()
        
        let dotSize = self.frame.width / 5
        let size = dotSize - (CGFloat(index) * (dotSize / 4))
        let delay = Double(index + 1) / 20
        
        let groupAnimation = CAAnimationGroup()
        let sizeAnimation = Animations().sizeAnimation
        let cornerRadiusAnimation = Animations().cornerRadiusAnimation
        let clockwiseAnimation = CAKeyframeAnimation(keyPath: "position")
        
        groupAnimation.duration = 1.3
        groupAnimation.repeatCount = HUGE
        
        sizeAnimation.fromValue = NSValue(cgSize: dot.frame.size)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: size, height: size))
        sizeAnimation.fillMode = kCAFillModeForwards
        sizeAnimation.isRemovedOnCompletion = false
        sizeAnimation.duration = 1
        sizeAnimation.beginTime = delay
        
        cornerRadiusAnimation.fromValue = dot.frame.width / 2
        cornerRadiusAnimation.toValue = size / 2
        cornerRadiusAnimation.fillMode = kCAFillModeForwards
        cornerRadiusAnimation.isRemovedOnCompletion = false
        cornerRadiusAnimation.duration = 1
        cornerRadiusAnimation.beginTime = delay
        
        clockwiseAnimation.path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width / 2, y: self.bounds.width / 2), radius: (self.bounds.width - dotSize) / 2, startAngle: -0.5 * .pi, endAngle: 1.5 * .pi, clockwise: true).cgPath
        clockwiseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        clockwiseAnimation.duration = 1
        clockwiseAnimation.beginTime = delay
        
        groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, clockwiseAnimation]
        groupAnimation.isRemovedOnCompletion = false
        
        dot.layer.add(groupAnimation, forKey: dot.description)
    }
}




















