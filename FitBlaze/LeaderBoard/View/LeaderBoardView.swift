//
//  LeaderBoardView.swift
//  FitBlaze
//
//  Created by Dilshad P on 02/05/25.
//

import SwiftUI

struct LeaderBoardView: View {
        
        
 @StateObject private var viewModel = LeaderBoardViewModel()
 @Binding var showTerms: Bool
 @AppStorage("username") var username: String?
        
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
                    ForEach(Array(viewModel.leaderResult.top10.enumerated()),id: \.element.id){idx, data in
                        
                        HStack {
                            Text("\(idx + 1)")
                            Text(data.usename)
                            
                            if username == data.usename {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            
                            Spacer()
                            Text("\(data.count)")
                            
                        }
                        .padding(.horizontal)
                    }
                }
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color.gray)
                
                if let user = viewModel.leaderResult.users {
                    
                    HStack {
                        Text(user.usename)
                        Spacer()
                        Text("\(user.count)")
                        
                    }
                    .padding(.horizontal)
                    
                }
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .fullScreenCover(isPresented:$showTerms){
                TermsView()
            }
            .onChange(of: showTerms) {
                    if !showTerms && username != nil {
                        Task {
                            try await viewModel.setLeaderboardDara()
                        }
                    }
                
            }
        }
    }


#Preview {
    LeaderBoardView(showTerms: .constant(false))
}
