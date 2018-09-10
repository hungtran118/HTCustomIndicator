//
//  CustomIndicator.swift
//  HTCustomIndicator
//
//  Created by UltraHigh on 9/10/18.
//  Copyright © 2018 HT. All rights reserved.
//

import Foundation

public class HTIndicator {
    
    private init() {}
    
    public static func create(frame: CGRect) -> UIView {
        let roundFill = RoundFill(frame: frame)
        return roundFill
    }
    
    public static func test() -> String {
        return "Test"
    }
}




