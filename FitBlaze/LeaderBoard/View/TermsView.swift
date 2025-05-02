//
//  TermsView.swift
//  FitBlaze
//
//  Created by Dilshad P on 02/05/25.
//

import SwiftUI

struct TermsView: View {
    
    @AppStorage("username") var username: String?
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var acceptedTerms = false
    
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            TextField("Username", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
            
            
            HStack(alignment: .top) {
                
                Button {
                    withAnimation {
                        acceptedTerms.toggle()
                    }
                } label: {
                    if acceptedTerms {
                        Image(systemName: "square.inset.filled")
                    }else {
                        Image(systemName: "square")
                    }
                }
                
                Text("By checking this box, you agree to our Terms of Service and Privacy Policy.")

            }
            
            Spacer()
            
            Button {
                if acceptedTerms && name.count > 2 {
                    username = name
                    dismiss()
                }
                
            } label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            
                    )
            }

        }
        .padding()
        
    }
}

#Preview {
    TermsView()
}
