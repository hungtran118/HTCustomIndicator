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
    private var allowAnimate: Bool = false
    private var stick1 = RoundFill()
    private var stick2 = RoundFill()
    private var stick3 = RoundFill()
    private var stick4 = RoundFill()
    private var stick5 = RoundFill()
    
    //MARK:- Custom color
    @IBInspectable public var indicatorColor: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    
    public var color = UIColor.white {
        didSet {
            stick1.backgroundColor = color
            stick2.backgroundColor = color
            stick3.backgroundColor = color
            stick4.backgroundColor = color
            stick5.backgroundColor = color
        }
    }
    
    //MARK:- Init
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        self.backgroundColor = UIColor.clear
        self.addSubview(stick1)
        self.addSubview(stick2)
        self.addSubview(stick3)
        self.addSubview(stick4)
        self.addSubview(stick5)
        toBaseState()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    public func toBaseState() {
        configStick(stick1, index: 0)
        configStick(stick2, index: 1)
        configStick(stick3, index: 2)
        configStick(stick4, index: 3)
        configStick(stick5, index: 4)
        allowAnimate = false
    }
    
    private func configStick(_ stick: UIView, index: Int) {
        stick.layer.removeAllAnimations()
        stick.backgroundColor = self.color
        
        if index == 0 || index == 4 {
            stick.frame.size = CGSize(width: frame.width / 9, height: frame.height)
        } else if index == 2 {
            stick.frame.size = CGSize(width: frame.width / 9, height: frame.height / 3)
        } else {
            stick.frame.size = CGSize(width: frame.width / 9, height: frame.height * 2 / 3)
        }
        
        stick.frame.origin.x = CGFloat(index*2) / 9 * self.frame.height
        stick.center.y = frame.height / 2
        stick.backgroundColor = self.color
        stick.layoutIfNeeded()
    }
    
    public func startAnimate() {
        toBaseState()
        allowAnimate = true
        animate(view: stick1, duration: 0)
        animate(view: stick2, duration: 0.25)
        animate(view: stick3, duration: 0.5)
        animate(view: stick4, duration: 0.25)
        animate(view: stick5, duration: 0)
    }
    
    private func animate(view: UIView, duration: Double) {
        //Beginning animate
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        
        let sizeAnimation = CABasicAnimation(keyPath: "bounds.size.height")
        sizeAnimation.fromValue = view.frame.size.height
        sizeAnimation.toValue = self.frame.size.height
        sizeAnimation.isRemovedOnCompletion = true
        
        CATransaction.setCompletionBlock {
            
            //Comming animate
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.5)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            
            let sizeAnimation2 = CABasicAnimation(keyPath: "bounds.size.height")
            sizeAnimation2.fromValue = self.frame.size.height
            sizeAnimation2.toValue = self.frame.size.height / 3
            sizeAnimation2.autoreverses = true
            sizeAnimation2.repeatCount = HUGE
            view.layer.add(sizeAnimation2, forKey: "sizeAnimate2")
            if !self.allowAnimate {
                self.toBaseState()
            }
            CATransaction.commit()
        }
        
        view.layer.add(sizeAnimation, forKey: nil)
        
        CATransaction.commit()
    }
}



















