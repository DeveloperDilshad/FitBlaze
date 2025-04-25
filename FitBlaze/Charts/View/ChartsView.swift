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
    var count: Double
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
    
    @Published var mockOneMonthData = [DailyStepModel]()
    @Published var mockThreeMonthData = [DailyStepModel]()
    @Published var mockOneYearData = [DailyStepModel]()
    
    
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
            let dailyStepData = DailyStepModel(date: currentDate, count: Double(randomStepCount))
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
            
            ZStack{
                switch selectedOption {
                case .oneWeek:
                    Chart {
                        ForEach(viewModel.mockData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .oneMonth:
                    Chart {
                        ForEach(viewModel.mockOneMonthData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .threeMonth:
                    Chart {
                        ForEach(viewModel.mockThreeMonthData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .yearToDate:
                    EmptyView()
                case .onYear:
                    Chart {
                        ForEach(viewModel.mockOneYearData) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count))
                        }
                    }
                }
            }
            .foregroundStyle(.green)
            .frame(maxHeight: 350)
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
