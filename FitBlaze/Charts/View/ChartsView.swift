//
//  HistoricDataView.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI
import Charts

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
                            ForEach(viewModel.oneYTDchartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps", data.count))
                            }
                        }
                    }
                case .onYear:
                    VStack {
                        ChartDataView(average: viewModel.oneYearAverage,total: viewModel.oneYearTotal)
                        Chart {
                            ForEach(viewModel.oneYearChartData) { data in
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
