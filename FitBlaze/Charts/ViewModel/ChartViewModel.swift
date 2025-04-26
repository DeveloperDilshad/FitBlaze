//
//  ChartViewModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 26/04/25.
//

import Foundation

class ChartsViewModel: ObservableObject {
    
    let mockData = [
        DailyStepModel(date: Date(), count: 12567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date() ) ?? Date(), count: 12567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date() ) ?? Date(), count: 32567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date() ) ?? Date(), count: 42567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date() ) ?? Date(), count: 62567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date() ) ?? Date(), count: 2567),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -6, to: Date() ) ?? Date(), count: 7567),
        
    ]
    
    let mocYTDData = [
        MonthlyStepModel(date: Date(), count: 12567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -1, to: Date() ) ?? Date(), count: 32567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -2, to: Date() ) ?? Date(), count: 22567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -3, to: Date() ) ?? Date(), count: 42567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -4, to: Date() ) ?? Date(), count: 52567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -5, to: Date() ) ?? Date(), count: 82567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -6, to: Date() ) ?? Date(), count: 72567),
        MonthlyStepModel(date: Calendar.current.date(byAdding: .month, value: -7, to: Date() ) ?? Date(), count: 62567),
    ]
    
    @Published var oneWeekAverage = 5678
    @Published var oneWeekTotal = 12456
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var oneMonthAverage = 0
    @Published var oneMontTotal = 0
    
    @Published var mockThreeMonthData = [DailyStepModel]()
    @Published var threeMonthAverage = 0
    @Published var threeMontTotal = 0
    
    @Published var oneYTDAverage = 0
    @Published var oneYTDTotal = 0
    
    @Published var mockOneYearData = [DailyStepModel]()
    @Published var oneYearAverage = 0
    @Published var oneYearTotal = 0
    
    
    init () {
        let mock3MonthData = mockDataForDay(day: 90)
        let mock1MonthData = mockDataForDay(day: 30)
        let mock1YearData = mockDataForDay(day: 365)
        DispatchQueue.main.async {
            self.mockThreeMonthData = mock3MonthData
            self.mockOneMonthData = mock1MonthData
            self.mockOneYearData = mock1YearData
        }
    }

    func mockDataForDay(day:Int) -> [DailyStepModel] {
        var mockData: [DailyStepModel] = []
        for day in 0..<day {
            let currentDate = Calendar.current.date(byAdding: .day, value: -day, to: Date()) ?? Date()
            let randomStepCount = Int.random(in: 5000...15000)
            let dailyStepData = DailyStepModel(date: currentDate, count: randomStepCount)
            mockData.append(dailyStepData)
        }
        return mockData
    }
}
