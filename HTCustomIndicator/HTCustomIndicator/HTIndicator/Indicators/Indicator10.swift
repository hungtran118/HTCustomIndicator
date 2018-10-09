//
//  Indicator10.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/9/18.
//

import Foundation

class Indicator10: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES
    
    private var square1 = UIView()
    private var square2 = UIView()
    private var square3 = UIView()
    private var square4 = UIView()
    private var square5 = UIView()
    private var square6 = UIView()
    private var square7 = UIView()
    private var square8 = UIView()
    private var square9 = UIView()
    
    private let groupAnimation = CAAnimationGroup()
    private let sizeAnimation = Animations().sizeAnimation
    
    //MARK:- Init
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = .clear
        self.setColor()
        self.setToBaseState()
        self.addSubview(square1)
        self.addSubview(square2)
        self.addSubview(square3)
        self.addSubview(square4)
        self.addSubview(square5)
        self.addSubview(square6)
        self.addSubview(square7)
        self.addSubview(square8)
        self.addSubview(square9)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        square1.backgroundColor = self.color
        square2.backgroundColor = self.color
        square3.backgroundColor = self.color
        square4.backgroundColor = self.color
        square5.backgroundColor = self.color
        square6.backgroundColor = self.color
        square7.backgroundColor = self.color
        square8.backgroundColor = self.color
        square9.backgroundColor = self.color
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configSquare(square1, index: 0)
        configSquare(square2, index: 1)
        configSquare(square3, index: 2)
        configSquare(square4, index: 3)
        configSquare(square5, index: 4)
        configSquare(square6, index: 5)
        configSquare(square7, index: 6)
        configSquare(square8, index: 7)
        configSquare(square9, index: 8)
    }
    
    private func configSquare(_ square: UIView, index: Int) {
        
        let squareSize = self.frame.width / 3
        
        square.frame.size = CGSize(width: squareSize, height: squareSize)
        square.frame.origin.x = CGFloat(index % 3) * squareSize
        square.frame.origin.y = index/3 < 1 ? 0 : index/3 < 2 ? squareSize : squareSize * 2
        square.backgroundColor = self.color
        square.layoutIfNeeded()
    }
    
    override public func startAnimate() {
        super.startAnimate()
        
        animate(square: square7, delay: 0)
        animate(square: square4, delay: 0.1)
        animate(square: square8, delay: 0.1)
        animate(square: square5, delay: 0.2)
        animate(square: square1, delay: 0.2)
        animate(square: square9, delay: 0.2)
        animate(square: square2, delay: 0.3)
        animate(square: square6, delay: 0.3)
        animate(square: square3, delay: 0.4)
    }
    
    private func animate(square: UIView, delay: TimeInterval) {
        
        square.layer.removeAllAnimations()
        
        groupAnimation.beginTime = CACurrentMediaTime() + delay
        groupAnimation.duration = 1.2
        groupAnimation.repeatCount = HUGE
        
        sizeAnimation.fromValue = square.frame.size
        sizeAnimation.toValue = CGSize.zero
        sizeAnimation.autoreverses = true
        sizeAnimation.duration = 0.3
        sizeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        groupAnimation.animations = [sizeAnimation]
        groupAnimation.isRemovedOnCompletion = false
        
        square.layer.add(groupAnimation, forKey: square.description)
    }
}

















