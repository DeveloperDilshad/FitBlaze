//
//  FitnessTabView.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI

struct FitnessTabView: View {
    
    @AppStorage("username") var username: String?
    @State private var selectedTab = "Home"
    @State  var showTerms = false
    
    init() {
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = .green
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.green]
        
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag( "Home" )
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ChartsView()
                .tag( "Charts" )
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Charts")
                }
            
            LeaderBoardView(showTerms: $showTerms)
                .tag( "LeaderBoard" )
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("LeaderBoard")
                }
        }
        .onAppear {
            showTerms = username == nil
        }
    }
}

#Preview {
    FitnessTabView()
}
