//
//  FitnessTabView.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI

struct FitnessTabView: View {
    
    @State private var selectedTab = "Home"
    
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
            
            HistoricDataView()
                .tag( "Historic" )
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Historic")
                }
        }
    }
}

#Preview {
    FitnessTabView()
}
