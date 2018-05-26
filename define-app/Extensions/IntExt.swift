//
//  IntExt.swift
//  define-app
//
//  Created by Daniel Bonehill on 26/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation

extension Int {
    func inchesToFt() -> String {
        let ft = self / 12
        let inch = self % 12
        
        return "\(ft)ft \(inch)in"
    }
    
    func poundsToSt() -> String {
        let st = self / 14
        let lbs = self % 14
        
        return "\(st)st \(lbs)lbs"
    }
}
