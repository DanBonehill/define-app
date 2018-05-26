//
//  StringExt.swift
//  define-app
//
//  Created by Daniel Bonehill on 19/05/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation

extension String {
    func heightToInches() -> Int {
        let splitHeight = self.split(separator: " ")
        guard let ft = Int(splitHeight[0].components(separatedBy: CharacterSet.letters).joined()) else { return 0 }
        guard let inch = Int(splitHeight[1].components(separatedBy: CharacterSet.letters).joined()) else { return 0 }
        
        let ftToInches = ft * 12
        let height = ftToInches + inch
        
        return height
    }
    
    func weightToPounds() -> Int {
        let splitWeight = self.split(separator: " ")
        guard let st = Int(splitWeight[0].components(separatedBy: CharacterSet.letters).joined()) else { return 0 }
        guard let lbs = Int(splitWeight[1].components(separatedBy: CharacterSet.letters).joined()) else { return 0 }
        
        let stToLbs = st * 14
        let weight = stToLbs + lbs
        
        return weight
    }
}
