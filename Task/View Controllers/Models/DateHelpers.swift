//
//  DateHelpers.swift
//  Task
//
//  Created by micasasucasa on 1/30/19.
//  Copyright © 2019 Jacob Rosevear. All rights reserved.
//

import Foundation
extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }

}
