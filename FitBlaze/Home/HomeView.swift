//
//  HomeView.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI

struct HomeView: View {
    
    var mockActivity: [Activity] = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 100 step", image: "figure.walk", tintColor: .green, amount: "6,121"),
        Activity(id: 1, title: "Today Run", subtitle: "Goal 100 step", image: "figure.run", tintColor: .red, amount: "8,921"),
        Activity(id: 2, title: "Today Training", subtitle: "Goal 100 step", image: "figure.highintensity.intervaltraining", tintColor: .blue, amount: "1721"),
        Activity(id: 3, title: "Today Workout", subtitle: "Goal 100 step", image: "figure.run.treadmill", tintColor: .purple, amount: "10,345"),

    ]
    
    @State var calories:Int = 123
    @State var active:Int = 52
    @State var stand:Int = 8
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment:.leading){
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.red)
                            
                            Text("123 kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.green)
                            
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundStyle(.blue)
                            
                            Text("8 hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all,20)
                        
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                            .padding(.all,40)
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("Show more button Pressed")
                    } label: {
                        Text("Show more")
                            .padding(.all,10)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }

                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing:20), count: 2)) {
                    
                    ForEach(mockActivity) {activity in
                        
                        ActivityCard(activity: activity)
                    }
                    
                }
                .padding(.horizontal)
            }
            
        }
    }
}

#Preview {
    HomeView()
}
