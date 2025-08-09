//
//  FitnessProfileButton.swift
//  FitBlaze
//
//  Created by Dilshad P on 04/08/25.
//

import SwiftUI

struct FitnessProfileButton: View {
    
    var title:String
    var image: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: image)
                Text(title)
            }
            .foregroundStyle(Color.primary)
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    FitnessProfileButton(title: "Edit Name", image:"pencil" ){}
}
