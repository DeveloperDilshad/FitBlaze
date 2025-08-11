//
//  FitnessProfileItemButton.swift
//  FitBlaze
//
//  Created by Dilshad P on 11/08/25.
//

import SwiftUI

struct FitnessProfileItemButton: View {
    @State var title:String
    @State var backgroundColor:Color
    var action: () -> Void
    var body: some View {
        Button {
         
                action()
        } label: {
            Text(title)
                
                .frame(maxWidth: 200,maxHeight: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor)
                )
                .padding()
        }
    }
}

#Preview {
    FitnessProfileItemButton(title: "Done", backgroundColor: .black){}
}
