//
//  FitBlazeApp.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI
import FirebaseCore

@main
struct FitBlazeApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            FitnessTabView()
        }
    }
}
