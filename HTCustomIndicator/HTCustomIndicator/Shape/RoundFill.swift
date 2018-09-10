//
//  RoundFill.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import UIKit

class RoundFill: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = min(frame.width, frame.height) / 2
        clipsToBounds = true
    }
    
    override var frame: CGRect {
        didSet {
            layer.cornerRadius = min(frame.width, frame.height) / 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


