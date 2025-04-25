//
//  Workouts.swift
//  FitBlaze
//
//  Created by Dilshad P on 23/04/25.
//

import SwiftUI


struct Workout: Identifiable {
    let id: UUID
    let image: String
    let tintColor: Color
    let title: String
    let duration: String
    let date: String
    let calories: String
    
}
