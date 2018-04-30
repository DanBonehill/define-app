//
//  NSDateExt.swift
//  define-app
//
//  Created by Daniel Bonehill on 30/04/2018.
//  Copyright © 2018 Daniel Bonehill. All rights reserved.
//

import Foundation

extension NSDate {
    func getDateString() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self as Date)
        let month = calendar.component(.month, from: self as Date)
        let year = calendar.component(.year, from: self as Date)
        
        return "\(day)/\(month)/\(year)"
    }
}
