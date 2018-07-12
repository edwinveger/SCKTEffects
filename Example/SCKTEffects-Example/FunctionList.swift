//
//  FunctionList.swift
//  SCKTEffects-Example
//
//  Created by Edwin on 12-07-18.
//  Copyright © 2018 pierreCode. All rights reserved.
//

import SCKTEffectsCore

extension SKTTimingFunction {
    
    static let timingFunctions: [(TimingFunction, String)] = [
        (linear, "linear"),
        (backEaseOut,"backEaseOut"),
        (sineEaseOut, "sineEaseOut"),
        (circularEaseOut, "circularEaseOut"),
        (elasticEaseOut, "elasticEaseOut"),
        (bounceEaseOut, "bounceEaseOut"),
        (exponentialEaseOut, "exponentialEaseOut"),
        (cubicEaseOut, "cubicEaseOut")
    ]
}
