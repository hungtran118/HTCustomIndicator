//
//  Indicator2.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/5/18.
//

import Foundation

class Indicator2: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var circle1 = UIView()
    private var circle2 = UIView()
    private var circle3 = UIView()
    private var circle4 = UIView()
    private var circle5 = UIView()
    
    private let groupAnimation = CAAnimationGroup()
    private let sizeAnimation = Animations().sizeAnimation
    private let cornerRadiusAnimation = Animations().cornerRadiusAnimation
    private let fadeAnimation = Animations().fadeAnimation
    private let fadeOutAnimation = Animations().fadeAnimation
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = UIColor.clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(circle1)
        self.addSubview(circle2)
        self.addSubview(circle3)
        self.addSubview(circle4)
        self.addSubview(circle5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        circle1.layer.borderColor = self.color.cgColor
        circle2.layer.borderColor = self.color.cgColor
        circle3.layer.borderColor = self.color.cgColor
        circle4.layer.borderColor = self.color.cgColor
        circle5.layer.borderColor = self.color.cgColor
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configCircle(circle1)
        configCircle(circle2)
        configCircle(circle3)
        configCircle(circle4)
        configCircle(circle5)
    }
    
    private func configCircle(_ circle: UIView) {
        
        circle.frame = CGRect(x: frame.size.width / 2, y: frame.size.width / 2, width: 0, height: 0)
        circle.layer.borderColor = self.color.cgColor
        circle.layer.borderWidth = frame.size.width / 40
        circle.alpha = 0.1
        circle.layoutIfNeeded()
    }
    
    override func startAnimate() {
        super.startAnimate()
        
        animate(circle: circle1, delay: 0)
        animate(circle: circle2, delay: 0.1)
        animate(circle: circle3, delay: 0.2)
        animate(circle: circle4, delay: 0.3)
        animate(circle: circle5, delay: 0.4)
    }
    
    private func animate(circle: UIView, delay: TimeInterval) {
        
        circle.layer.removeAllAnimations()
        
        groupAnimation.beginTime = round(10*CACurrentMediaTime())/10 + delay
        groupAnimation.repeatCount = HUGE
        groupAnimation.duration = 1.2
        groupAnimation.isRemovedOnCompletion = false
        
        sizeAnimation.fromValue = NSValue(cgSize: CGSize.zero)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: self.frame.size.width, height: self.frame.size.width))
        sizeAnimation.isRemovedOnCompletion = false
        sizeAnimation.fillMode = kCAFillModeForwards
        sizeAnimation.duration = 0.7
        
        cornerRadiusAnimation.fromValue = 0
        cornerRadiusAnimation.toValue = self.frame.width / 2
        cornerRadiusAnimation.isRemovedOnCompletion = false
        cornerRadiusAnimation.fillMode = kCAFillModeForwards
        cornerRadiusAnimation.duration = 0.7
        
        fadeAnimation.fromValue = 0.1
        fadeAnimation.toValue = 0.6
        fadeAnimation.isRemovedOnCompletion = false
        fadeAnimation.fillMode = kCAFillModeForwards
        fadeAnimation.duration = 0.7
        
        fadeOutAnimation.fromValue = 0.6
        fadeOutAnimation.toValue = 0
        fadeOutAnimation.isRemovedOnCompletion = false
        fadeOutAnimation.fillMode = kCAFillModeForwards
        fadeOutAnimation.duration = 0.5
        fadeOutAnimation.beginTime = 0.7
        
        groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, fadeAnimation, fadeOutAnimation]
        
        circle.layer.add(groupAnimation, forKey: circle.description)
    }
}




















