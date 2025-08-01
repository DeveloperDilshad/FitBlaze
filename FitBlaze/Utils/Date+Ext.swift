//
//  Date+Ext.swift
//  FitBlaze
//
//  Created by Dilshad P on 01/08/25.
//

import Foundation

extension Date {
   
    static var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        return calendar.date(from: components) ?? Date()
    }
    
    
    func fetchMonthStartAndEndDate() ->(Date, Date) {
        let calendar = Calendar.current
        let startDateComponents = calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self))
        let startDate = calendar.date(from: startDateComponents) ?? self
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? self
        return (startDate, endDate)
    }
    
    
    func formatWorkoutDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, d"
        return dateFormatter.string(from: self)
    }
       
       func mondayDateFormat() -> String {
           let monday = Date.startOfWeek
           let formatter = DateFormatter()
           formatter.dateFormat = "MM-dd-yyyy"
           return formatter.string(from: monday)
       }
}
