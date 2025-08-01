//
//  Double+Ext.swift
//  FitBlaze
//
//  Created by Dilshad P on 01/08/25.
//

import Foundation

extension Double {
    func formattedString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
