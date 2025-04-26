//
//  MonthlyStepModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 26/04/25.
//

import Foundation

struct MonthlyStepModel: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var count: Int
}
