//
//  WorkoutCard.swift
//  FitBlaze
//
//  Created by Dilshad P on 23/04/25.
//

import SwiftUI

struct WorkoutCard: View {
    
    @State var workout: Workout
    
    var body: some View {
        
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
                .foregroundStyle(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(spacing: 16) {
                
                HStack {
                    Text(workout.title)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                }
                HStack {
                    Text(workout.date)
                        .font(.subheadline)
                    Spacer()
                    Text(workout.calories)
                        .font(.caption)
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: UUID(), image: "figure.run", tintColor: .green, title: "Running", duration: "23 mins", date: "Aug 3", calories: "371 kcal"))
}
