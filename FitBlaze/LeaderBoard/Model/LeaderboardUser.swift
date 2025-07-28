//
//  LeaderboardUser.swift
//  FitBlaze
//
//  Created by Dilshad P on 28/07/25.
//

import Foundation

struct LeaderBoardUser: Codable,Identifiable {
    
    var id: UUID = UUID()
    let usename: String
    let count: Int
    
}

struct LeaderBoardResult: Codable {
    let users: LeaderBoardUser?
    let top10: [LeaderBoardUser]
}




    
