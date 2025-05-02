//
//  LeaderBoardView.swift
//  FitBlaze
//
//  Created by Dilshad P on 02/05/25.
//

import SwiftUI


struct LeaderBoardUser: Codable,Identifiable {
    
    var id: UUID = UUID()
    let createdAt: String
    let usename: String
    let count: Int
    
}

class LeaderBoardViewModel: ObservableObject {
    
    let mockData = [
        LeaderBoardUser(createdAt: "", usename: "James", count: 1466),
        LeaderBoardUser(createdAt: "", usename: "Sean Allen", count: 1576),
        LeaderBoardUser(createdAt: "", usename: "Shane", count: 1097)
        ,LeaderBoardUser(createdAt: "", usename: "Quil", count: 19877)
        ,LeaderBoardUser(createdAt: "", usename: "Baby", count: 134),
    ]
}

struct LeaderBoardView: View {
    
    
    @StateObject private var viewModel = LeaderBoardViewModel()
    @Binding var showTerms: Bool
    
    var body: some View {
        VStack {
            
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Text("Name")
                    .bold()
                
                Spacer()
                
                Text("Steps")
                    .bold()
            }
            .padding()
            
            LazyVStack(spacing:16) {
                ForEach(viewModel.mockData){ data in
                    
                    HStack {

                        Text(data.usename)
                        Spacer()
                        Text("\(data.count)")

                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .fullScreenCover(isPresented:$showTerms){
            TermsView()
        }
    }
}

#Preview {
    LeaderBoardView(showTerms: .constant(false))
}
