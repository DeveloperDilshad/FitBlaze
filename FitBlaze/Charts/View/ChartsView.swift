//
//  HistoricDataView.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI
import Charts

struct DailyStepModel: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var count: Int
}

struct MonthlyStepModel: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var count: Int
}

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

enum ChartOPtion: String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "1YD"
    case onYear = "1Y"
}

struct ChartsView: View {
    
    @StateObject var viewModel = ChartsViewModel()
    @State var selectedOption:ChartOPtion = .oneWeek
    
    var body: some View {
        VStack {
            Text("Charts")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            ZStack {
                switch selectedOption {
                case .oneWeek:
                    
                    VStack {
                        
                        ChartDataView(average: viewModel.oneWeekAverage,total: viewModel.oneWeekTotal)
                        
                    Chart {
                        ForEach(viewModel.mockData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                    }
                case .oneMonth:
                    VStack {
                        ChartDataView(average: viewModel.oneMonthAverage,total: viewModel.oneMontTotal)
                        
                        Chart {
                            ForEach(viewModel.mockOneMonthData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                            }
                        }
                    }
                case .threeMonth:
                    VStack {
                        ChartDataView(average: viewModel.threeMonthAverage,total: viewModel.threeMontTotal)
                        Chart {
                            ForEach(viewModel.mockThreeMonthData) { data in
                                LineMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                            }
                        }
                    }
                case .yearToDate:
                    VStack {
                        ChartDataView(average: viewModel.oneYTDAverage,total: viewModel.oneYTDAverage)
                        Chart {
                            ForEach(viewModel.mocYTDData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps", data.count))
                            }
                        }
                    }
                case .onYear:
                    VStack {
                        ChartDataView(average: viewModel.oneYearAverage,total: viewModel.oneYearTotal)
                        Chart {
                            ForEach(viewModel.mockOneYearData) { data in
                                LineMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                            }
                        }
                    }
                }
            }
            .foregroundStyle(.green)
            .frame(maxHeight: 450)
            .padding(.horizontal)
            
            HStack {
                ForEach(ChartOPtion.allCases,id: \.rawValue) { option in
                    Button(option.rawValue){
                        
                        withAnimation {
                            selectedOption = option
                        }
                    }
                    .padding()
                    .foregroundStyle(selectedOption == option ? .white : .green)
                    .background(selectedOption == option ? .green : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        
    }
}

#Preview {
    ChartsView()
}
