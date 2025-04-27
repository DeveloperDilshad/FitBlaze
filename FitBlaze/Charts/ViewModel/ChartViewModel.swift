//
//  ChartViewModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 26/04/25.
//

import Foundation

class ChartsViewModel: ObservableObject {
    
    private let healthManager = HealthManager.shared
    
    
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
    
    @Published var oneYTDchartData: [MonthlyStepModel] = []
    @Published var oneYTDAverage = 0
    @Published var oneYTDTotal = 0
    
    @Published var oneYearChartData: [MonthlyStepModel] = []
    @Published var oneYearAverage = 0
    @Published var oneYearTotal = 0
    
    
    init () {
        let mock3MonthData = mockDataForDay(day: 90)
        let mock1MonthData = mockDataForDay(day: 30)
        DispatchQueue.main.async {
            self.mockThreeMonthData = mock3MonthData
            self.mockOneMonthData = mock1MonthData
        }
        
        fetchYTDandOneYearData()
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
    
    
    func fetchYTDandOneYearData() {
        healthManager.fetchYTDandOneYearData { result in
            
            switch result {
            case.success(let yearandYTDresult):
                DispatchQueue.main.async {
                    self.oneYearChartData = yearandYTDresult.oneYearResult
                    self.oneYTDchartData = yearandYTDresult.ytdResult
                    
                    self.oneYTDTotal = self.oneYTDchartData.reduce(0, {$0 + $1.count})
                    self.oneYearTotal = self.oneYearChartData.reduce(0, {$0 + $1.count})
                    
                    self.oneYTDAverage = self.oneYTDTotal / Calendar.current.component(.month, from: Date())
                    self.oneYearAverage = self.oneYearTotal / 12
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
