//
//  Indicator2.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/4/18.
//

import Foundation

class Indicator2: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var circle1 = UIView()
    private var circle2 = UIView()
    private var circle3 = UIView()
    
    private let groupAnimation = CAAnimationGroup()
    private let sizeAnimation = Animations.sizeAnimation
    private let cornerRadiusAnimation = Animations.cornerRadiusAnimation
    private let fadeAnimation = Animations.fadeAnimation
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = UIColor.clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        circle1.backgroundColor = self.color
        circle2.backgroundColor = self.color
        circle3.backgroundColor = self.color
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    public override func setToBaseState() {
        
        configCircle(circle1, index: 0)
        configCircle(circle2, index: 1)
        configCircle(circle3, index: 2)
    }
    
    private func configCircle(_ circle: UIView, index: Int) {
            
        circle.frame = CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: 0, height: 0)
        circle.backgroundColor = self.color
        circle.alpha = 0.8
        circle.layoutIfNeeded()
    }
    
    override public func startAnimate() {
        
        animate(view: circle1, delay: 0)
        animate(view: circle2, delay: 0.2)
        animate(view: circle3, delay: 0.4)
    }
    
    private func animate(view: UIView, delay: TimeInterval) {
        
        view.layer.removeAllAnimations()
        
        groupAnimation.beginTime = CACurrentMediaTime() + delay
        groupAnimation.duration = 1
        groupAnimation.repeatCount = HUGE
        
        sizeAnimation.fromValue = NSValue(cgSize: CGSize(width: 0, height: 0))
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: self.frame.width, height: self.frame.height))
        
        cornerRadiusAnimation.fromValue = 0
        cornerRadiusAnimation.toValue = self.frame.width / 2
        
        fadeAnimation.fromValue = 0.8
        fadeAnimation.toValue = 0
        
        groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, fadeAnimation]
        groupAnimation.isRemovedOnCompletion = false
        
        view.layer.add(groupAnimation, forKey: nil)
    }
}

















