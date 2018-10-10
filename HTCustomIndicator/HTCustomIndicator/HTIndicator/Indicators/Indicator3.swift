//
//  Indicator3.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/5/18.
//

import Foundation

class Indicator3: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var dot1 = UIView()
    private var dot2 = UIView()
    private var dot3 = UIView()
    private var dot4 = UIView()
    private var dot5 = UIView()
    private var dot6 = UIView()
    private var dot7 = UIView()
    private var dot8 = UIView()
    
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
        self.addSubview(dot6)
        self.addSubview(dot7)
        self.addSubview(dot8)
        
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
        dot6.backgroundColor = self.color
        dot7.backgroundColor = self.color
        dot8.backgroundColor = self.color
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        let dotSize = self.frame.width * 0.2
        let midPos = (self.frame.width - dotSize) / 2
        
        //top
        configDot(dot1, frame: CGRect(x: midPos, y: 0, width: dotSize, height: dotSize), index: 0)
        
        //top right
        configDot(dot2, frame: CGRect(x: midPos + (midPos / sqrt(2)), y: midPos - (midPos / sqrt(2)), width: dotSize, height: dotSize), index: 1)
        
        //right
        configDot(dot3, frame: CGRect(x: midPos * 2, y: midPos, width: dotSize, height: dotSize), index: 2)
        
        //bot right
        configDot(dot4, frame:  CGRect(x: midPos + (midPos / sqrt(2)), y: midPos + (midPos / sqrt(2)), width: dotSize, height: dotSize), index: 3)
        
        //bot
        configDot(dot5, frame: CGRect(x: midPos, y: midPos * 2, width: dotSize, height: dotSize), index: 4)
        
        //bot left
        configDot(dot6, frame: CGRect(x: midPos - (midPos / sqrt(2)), y: midPos + (midPos / sqrt(2)), width: dotSize, height: dotSize), index: 5)
        
        //left
        configDot(dot7, frame: CGRect(x: 0, y: midPos, width: dotSize, height: dotSize), index: 6)
        
        //top left
        configDot(dot8, frame: CGRect(x: midPos - (midPos / sqrt(2)), y: midPos - (midPos / sqrt(2)), width: dotSize, height: dotSize), index: 7)
    }
    
    private func configDot(_ dot: UIView, frame: CGRect, index: Int) {
        
        dot.frame.origin = frame.origin
        
        if index == 0 {
            dot.frame.size = frame.size
        } else if index == 1 || index == 7 {
            dot.frame.size = CGSize(width: frame.size.width * 7/8, height: frame.size.width * 7/8)
            dot.alpha = 7/8
        } else if index == 2 || index == 6 {
            dot.frame.size = CGSize(width: frame.size.width * 6/8, height: frame.size.width * 6/8)
            dot.alpha = 6/8
        } else if index == 3 || index == 5 {
            dot.frame.size = CGSize(width: frame.size.width * 5/8, height: frame.size.width * 5/8)
            dot.alpha = 5/8
        } else {
            dot.frame.size = CGSize(width: frame.size.width * 4/8, height: frame.size.width * 4/8)
            dot.alpha = 4/8
        }
        
        dot.layer.cornerRadius = dot.frame.width / 2
        dot.layer.masksToBounds = dot.frame.width / 2 > 0
        dot.layoutIfNeeded()
    }
    
    override func startAnimate() {
        super.startAnimate()
        
        configAnimate(dot1, index: 0)
        configAnimate(dot2, index: 1)
        configAnimate(dot3, index: 2)
        configAnimate(dot4, index: 3)
        configAnimate(dot5, index: 4)
        configAnimate(dot6, index: 5)
        configAnimate(dot7, index: 6)
        configAnimate(dot8, index: 7)
    }
    
    private func configAnimate(_ view: UIView, index: Int) {
        
        let dotSize = self.frame.width * 0.2
        var duration: Double = 0
        var beginSize: CGFloat = 0
        var beginAlpha: CGFloat = 0
        var commingSize: CGFloat = 0
        var commingAlpha: CGFloat = 0
        
        //Config duration
        if index == 0 || index == 4 {
            duration = 0
        } else if index == 1 || index == 5 {
            duration = 0.5 - 3/8
        } else if index == 2 || index == 6 {
            duration = 0.5 - 2/8
        } else if index == 3 || index == 7 {
            duration = 0.5 - 1/8
        } else {
            duration = 0.5
        }
        
        //Config effect
        if index == 0 || index == 1 || index == 2 || index == 3 {
            beginSize = dotSize
            beginAlpha = 1
            commingSize = dotSize / 2
            commingAlpha = 0.5
        } else {
            beginSize = dotSize / 2
            beginAlpha = 0.5
            commingSize = dotSize
            commingAlpha = 1
        }
        
        configAniamte(view: view, duration: duration, beginSize: beginSize, beginAlpha: beginAlpha, commingSize: commingSize, commingAlpha: commingAlpha)
    }
    
    private func configAniamte(view: UIView, duration: Double, beginSize: CGFloat, beginAlpha: CGFloat, commingSize: CGFloat, commingAlpha: CGFloat) {
        
        view.layer.removeAllAnimations()
        
        //Beginning animate
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        
        let groupAnimation = CAAnimationGroup()
        let sizeAnimation = Animations().sizeAnimation
        let cornerRadiusAnimation = Animations().cornerRadiusAnimation
        let fadeAnimation = Animations().fadeAnimation
        
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.isRemovedOnCompletion = false
        
        sizeAnimation.fromValue = NSValue(cgSize: view.frame.size)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: beginSize, height: beginSize))
        
        cornerRadiusAnimation.fromValue = view.frame.size.width / 2
        cornerRadiusAnimation.toValue = beginSize / 2
        
        fadeAnimation.fromValue = view.alpha
        fadeAnimation.toValue = beginAlpha
        
        CATransaction.setCompletionBlock {
            
            //Comming animate
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.5)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            
            let groupAnimation2 = CAAnimationGroup()
            let sizeAnimation2 = Animations().sizeAnimation
            let cornerRadiusAnimation2 = Animations().cornerRadiusAnimation
            let fadeAnimation2 = Animations().fadeAnimation
            
            groupAnimation2.autoreverses = true
            groupAnimation2.repeatCount = HUGE
            
            sizeAnimation2.fromValue = NSValue(cgSize: CGSize(width: beginSize, height: beginSize))
            sizeAnimation2.toValue = NSValue(cgSize: CGSize(width: commingSize, height: commingSize))
            
            cornerRadiusAnimation2.fromValue = beginSize / 2
            cornerRadiusAnimation2.toValue = commingSize / 2
            
            fadeAnimation2.fromValue = beginAlpha
            fadeAnimation2.toValue = commingAlpha
            
            groupAnimation2.animations = [sizeAnimation2, cornerRadiusAnimation2, fadeAnimation2]
            groupAnimation2.isRemovedOnCompletion = false
            view.layer.add(groupAnimation2, forKey: "\(view.description)2")
            
            CATransaction.commit()
        }
        
        groupAnimation.animations = [sizeAnimation, cornerRadiusAnimation, fadeAnimation]
        view.layer.add(groupAnimation, forKey: "\(view.description)1")
        
        CATransaction.commit()
    }
}




















