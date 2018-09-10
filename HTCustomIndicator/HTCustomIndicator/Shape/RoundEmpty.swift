//
//  RoundEmpty.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import UIKit

class RoundEmpty: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, color: UIColor, borderWidth: CGFloat) {
        self.init(frame: frame)
        layer.cornerRadius = min(frame.width, frame.height) / 2
        layer.borderWidth = borderWidth
        layer.borderColor = color.cgColor
        backgroundColor = .clear
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}






