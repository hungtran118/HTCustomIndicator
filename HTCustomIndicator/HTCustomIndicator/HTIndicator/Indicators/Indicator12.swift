//
//  Indicator12.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/11/18.
//

import Foundation

public class Indicator12: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var stick1 = UIView()
    private var stick2 = UIView()
    private var stick3 = UIView()
    private var stick4 = UIView()
    private var stick5 = UIView()
    private let groupAnimation = CAAnimationGroup()
    private let heightAnimationIncrease = Animations().heightAnimation
    private let heightAnimationDecrease = Animations().heightAnimation
    
    //MARK:- Init
    
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = .clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(stick1)
        self.addSubview(stick2)
        self.addSubview(stick3)
        self.addSubview(stick4)
        self.addSubview(stick5)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        stick1.backgroundColor = self.color
        stick2.backgroundColor = self.color
        stick3.backgroundColor = self.color
        stick4.backgroundColor = self.color
        stick5.backgroundColor = self.color
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configStick(stick1, index: 0)
        configStick(stick2, index: 1)
        configStick(stick3, index: 2)
        configStick(stick4, index: 3)
        configStick(stick5, index: 4)
    }
    
    private func configStick(_ stick: UIView, index: Int) {
        
        stick.frame.size = CGSize(width: frame.width / 9, height: frame.height / 3)
        stick.frame.origin.x = CGFloat(index*2) / 9 * self.frame.height
        stick.center.y = self.frame.height / 2
        stick.layer.cornerRadius = stick.frame.width / 2
        stick.layoutIfNeeded()
    }
    
    override public func startAnimate() {
        super.startAnimate()
        
        animate(stick: stick1, delay: 0)
        animate(stick: stick2, delay: 0.1)
        animate(stick: stick3, delay: 0.2)
        animate(stick: stick4, delay: 0.3)
        animate(stick: stick5, delay: 0.4)
    }
    
    private func animate(stick: UIView, delay: Double) {
        
        stick.layer.removeAllAnimations()
        
        heightAnimationIncrease.fromValue = stick.frame.size.height
        heightAnimationIncrease.toValue = self.frame.size.height
        heightAnimationIncrease.duration = 0.25
        heightAnimationIncrease.fillMode = kCAFillModeForwards
        heightAnimationIncrease.isRemovedOnCompletion = false
        
        heightAnimationDecrease.fromValue = self.frame.size.height
        heightAnimationDecrease.toValue = stick.frame.size.height
        heightAnimationDecrease.duration = 0.25
        heightAnimationDecrease.beginTime = 0.5
        heightAnimationDecrease.fillMode = kCAFillModeForwards
        heightAnimationDecrease.isRemovedOnCompletion = false
        
        groupAnimation.duration = 1.2
        groupAnimation.beginTime = round(10*CACurrentMediaTime())/10 + delay
        groupAnimation.repeatCount = HUGE
        groupAnimation.animations = [heightAnimationIncrease, heightAnimationDecrease]
        groupAnimation.isRemovedOnCompletion = false
        
        stick.layer.add(groupAnimation, forKey: nil)
        
    }
}

