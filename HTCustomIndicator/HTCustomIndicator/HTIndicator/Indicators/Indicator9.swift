//
//  Indicator9.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 10/9/18.
//

import Foundation

public class Indicator9: BaseIndicator {
    
    //MARK:- SUPPORT VARIABLES

    private let rotateAnimation = Animations().rotateAnimation
    private var radial: RadialCircleView?
    
    //MARK:- Init
    
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: min(frame.width, frame.height), height: min(frame.width, frame.height)))
        
        self.backgroundColor = .clear
        self.setToBaseState()
        self.setColor()
        self.addSubview(radial!)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Config
    
    override func setColor() {
        
        radial?.removeFromSuperview()
        radial = RadialCircleView(frame: self.bounds, strokeColor: self.color)
        radial?.center = self.center
        radial?.backgroundColor = .clear
        self.addSubview(radial!)
        animate()
    }
    
    override func setFrame() {
        
        setToBaseState()
        startAnimate()
    }
    
    override func setToBaseState() {
        super.setToBaseState()
        
        configCircle()
    }
    
    private func configCircle() {
        
        radial = RadialCircleView(frame: self.bounds, strokeColor: self.color)
        radial?.center = self.center
        radial?.backgroundColor = .clear
    }
    
    override public func startAnimate() {
        super.startAnimate()
        
        animate()
    }
    
    private func animate() {
        
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = HUGE
        rotateAnimation.isRemovedOnCompletion = false
        
        radial?.layer.removeAllAnimations()
        radial?.layer.add(rotateAnimation, forKey: nil)
    }
}

class RadialCircleView: UIView {
    
    var strokeColor = UIColor.clear
    
    init(frame: CGRect, strokeColor: UIColor) {
        super.init(frame: frame)
        
        self.strokeColor = strokeColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let colorComponents = strokeColor.cgColor.components else { return }
        
        let thickness: CGFloat = rect.width / 10
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - thickness / 2
        var last: CGFloat = 0
        
        for i in 1...360 {
            
            let ang = CGFloat(i) / 180 * .pi
            let arc = UIBezierPath(arcCenter: center, radius: radius, startAngle: last, endAngle: ang, clockwise: true)
            arc.lineWidth = thickness
            last = ang
            
            if colorComponents.count == 4 {
                UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3] * CGFloat(i) / 360).set()
            } else {
                UIColor(white: colorComponents[0], alpha: colorComponents[1] * CGFloat(i) / 360).set()
            }
            
            arc.stroke()
        }
    }
}
