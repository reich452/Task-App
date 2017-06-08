//
//  DateHelpers.swift
//  TaskApp
//
//  Created by Nick Reichard on 6/7/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
