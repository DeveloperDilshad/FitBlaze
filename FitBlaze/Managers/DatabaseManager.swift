//
//  DatabaseManager.swift
//  FitBlaze
//
//  Created by Dilshad P on 06/05/25.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    let database = Firestore.firestore()
    let weaklyLeaderBoard = "\(Date().mondayDateFormat())-leaderboard"
    
    
    // fetch Leaderboard
    func fetchLeaderboard() async throws -> [LeaderBoardUser] {
        let snapshot = try await database.collection(weaklyLeaderBoard).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: LeaderBoardUser.self)})
    }
    
    
    // post (update) Leaderboard
    func postStepCountUpdateFor(username:String, count: Int) async throws {
        let leader = LeaderBoardUser(usename: username, count: count)
        let data = try  Firestore.Encoder().encode(leader)
        try await database.collection(weaklyLeaderBoard).document(username).setData(data, merge: false)
    }
}
