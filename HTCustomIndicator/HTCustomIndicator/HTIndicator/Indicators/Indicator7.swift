//
//  Indicator7.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/5/18.
//

import Foundation

class Indicator7: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var circleLayer = CAShapeLayer()
    private var circlePath = UIBezierPath()
    private var containerView = UIView()
    
    private let groupAnimation = CAAnimationGroup()
    private let animationFull = Animations().strokeEndAnimation
    private let animationEmpty = Animations().strokeEndAnimation
    private let rotateAnimation = Animations().rotateAnimation
    
    private var isClockwise: Bool = false
    private var timer = Timer()
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = UIColor.clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(containerView)
        self.containerView.layer.addSublayer(self.circleLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        circleLayer.strokeColor = self.color.cgColor
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configContainer()
        configCircle()
    }
    
    private func configContainer() {
        
        containerView = UIView(frame: self.bounds)
        containerView.layoutIfNeeded()
    }
    
    private func configCircle() {
        
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0, endAngle: 7, clockwise: true).cgPath
        
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineWidth = frame.width / 20
        circleLayer.strokeEnd = 0.8
        circleLayer.layoutIfNeeded()
    }
    
    override func startAnimate() {
        super.startAnimate()
        
        animateRotate()
        animateCircle()
    }
    
    private func animateRotate() {
        
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.duration = 1.2
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.isRemovedOnCompletion = false
        
        containerView.layer.removeAllAnimations()
        containerView.layer.add(rotateAnimation, forKey: nil)
    }
    
    private func animateCircle() {
        
        circleLayer.removeAllAnimations()
        timer.invalidate()
        
        animationFull.duration = 0.5
        animationFull.fromValue = 0
        animationFull.toValue = 0.8
        animationFull.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationFull.fillMode = kCAFillModeForwards
        animationFull.isRemovedOnCompletion = false
        
        animationEmpty.duration = 0.5
        animationEmpty.beginTime = 0.9
        animationEmpty.fromValue = 0.8
        animationEmpty.toValue = 0
        animationEmpty.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationEmpty.fillMode = kCAFillModeForwards
        animationEmpty.isRemovedOnCompletion = false
        
        groupAnimation.animations = [animationFull, animationEmpty]
        groupAnimation.duration = 1.8
        groupAnimation.repeatCount = HUGE
        groupAnimation.fillMode = kCAFillModeForwards
        groupAnimation.isRemovedOnCompletion = false
        
        circleLayer.add(groupAnimation, forKey: "animateCircle")
        
        timer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(changeLayerPath), userInfo: nil, repeats: true)
    }
    
    @objc private func changeLayerPath() {
        
        if isClockwise {
            circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: 0, endAngle: 7, clockwise: true).cgPath
        } else {
            circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10)/2, startAngle: -0.69, endAngle: -7.7, clockwise: false).cgPath
        }
        
        isClockwise = !isClockwise
    }
}











