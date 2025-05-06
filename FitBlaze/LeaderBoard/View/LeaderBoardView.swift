//
//  LeaderBoardView.swift
//  FitBlaze
//
//  Created by Dilshad P on 02/05/25.
//

import SwiftUI


struct LeaderBoardUser: Codable,Identifiable {
    
    var id: UUID = UUID()
    let usename: String
    let count: Int
    
}

class LeaderBoardViewModel: ObservableObject {
    
    let mockData = [
        LeaderBoardUser( usename: "James", count: 1466),
        LeaderBoardUser( usename: "Sean Allen", count: 1576),
        LeaderBoardUser( usename: "Shane", count: 1097)
        ,LeaderBoardUser(usename: "Quil", count: 19877)
        ,LeaderBoardUser(usename: "Baby", count: 134),
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
        .task {
            do{
                try await DatabaseManager.shared.postStepCountUpdateFor(username: "Json", count: 12340)
            }catch {
                print(error.localizedDescription)
            }
            
        }
    }
}

#Preview {
    LeaderBoardView(showTerms: .constant(false))
}
