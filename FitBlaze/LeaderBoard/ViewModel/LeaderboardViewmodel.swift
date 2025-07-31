//
//  LeaderboardViewmodel.swift
//  FitBlaze
//
//  Created by Dilshad P on 28/07/25.
//

import Foundation

class LeaderBoardViewModel: ObservableObject {
    
    
    init(){
        Task {
            do {
                try await setLeaderboardDara()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    @Published var leaderResult = LeaderBoardResult(users: nil, top10: [])
    
    let mockData = [
        LeaderBoardUser( usename: "James", count: 1466),
        LeaderBoardUser( usename: "Sean Allen", count: 1576),
        LeaderBoardUser( usename: "Shane", count: 1097)
        ,LeaderBoardUser(usename: "Quil", count: 19877)
        ,LeaderBoardUser(usename: "Baby", count: 134),
    ]
    
    func setLeaderboardDara()async throws {
        try await postStepCountUpdateFor()
        let result = try await fetchLeaderBoard()
        
        DispatchQueue.main.async {
            self.leaderResult = result
        }
        
    }
    
    func fetchLeaderBoard() async throws  -> LeaderBoardResult {
        let leaders = try await DatabaseManager.shared.fetchLeaderboard()
        let top10 = Array(leaders.sorted(by:{ $0.count > $1.count}).prefix(10))
        let username = UserDefaults.standard.string(forKey: "username")
        
        if let username = username, !top10.contains(where: {$0.usename == username}) {
            let user = leaders.first(where: {$0.usename == username})
            return LeaderBoardResult(users: user, top10: top10)
        }else {
            return LeaderBoardResult(users: nil, top10: top10)
        }
    }
        
        func postStepCountUpdateFor() async throws {
            let steps = try await fetchCurrentweekStepcount()
            guard let username = UserDefaults.standard.string(forKey: "username") else {
                throw URLError(.badURL)
            }
            try await DatabaseManager.shared.postStepCountUpdateFor(username: username, count: Int(steps))
        }
    
    private func fetchCurrentweekStepcount() async throws -> Double {
        try await withCheckedThrowingContinuation { continuation in
            HealthManager.shared.fetchCurrentweekStepcount { result in
                continuation.resume(with: result)
            }
        }
    }
}
