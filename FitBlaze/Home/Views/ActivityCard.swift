//
//  ActivityCard.swift
//  FitBlaze
//
//  Created by Dilshad P on 22/04/25.
//

import SwiftUI

struct ActivityCard: View {
    
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundStyle(activity.tintColor)
                }
                
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCard(activity: Activity(id: UUID(), title: "Today Steps", subtitle: "Goal 100 step", image: "figure.wal", tintColor: .green, amount: "6,121"))
}
