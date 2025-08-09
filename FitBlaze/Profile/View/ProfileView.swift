//
//  ProfileView.swift
//  FitBlaze
//
//  Created by Dilshad P on 03/08/25.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("profileName") var profileName: String?
    @AppStorage("profileImage") var profileImage: String?
    @State private var isEditImage: Bool = false
    @State private var selectedImage: String?
    @State private var images = [
        "avatar","avatar-2","avatar-3","avatar-4","avatar-5","avatar-6","avatar-7", "avatar-8","avatar-9","avatar-10"
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
               Image(profileImage ?? "avatar")
                    .resizable()
                    .frame(width: 100, height: 64)
                    .padding(.all,8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.gray.opacity(0.3))
                    )
                    .onTapGesture {
                        isEditImage.toggle()
                    }
                VStack(alignment: .leading) {
                    Text("Good Morining")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                    
                    Text(profileName ?? "Name")
                        .font(.title)
                }
                
            }
            
            if isEditImage {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(images,id: \.self) { image in
                            Button {
                                withAnimation {
                                    selectedImage = image
                                }
                            } label: {
                                VStack {
                                    Image(image)
                                        .resizable()
                                        .frame(width: 100, height: 64)
                                        
                                    if selectedImage == image {
                                            Circle()
                                            .fill(.primary)
                                            .frame(width: 16, height: 16)
                                    }
                                }
                                .padding()
                            }

                        }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.gray.opacity(0.3))
                )
                
                Button {
                    withAnimation {
                        isEditImage = false
                        profileImage = selectedImage
                    }
                } label: {
                    Text("Done")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: 200,maxHeight: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                        )
                        .padding(.bottom)
                }

            }
            
            VStack {
                FitnessProfileButton(title: "Edit Name", image: "pencil"){
                    
                }
                

                FitnessProfileButton(title: "Edit Image", image: "pencil"){
                    
                    isEditImage = true
                }
                
               
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.gray.opacity(0.3))
            )
            
            VStack {
                FitnessProfileButton(title: "Contact Us", image: "envelope"){
                    
                }
                

                FitnessProfileButton(title: "Privacy policy", image: "doc"){
                    
                }
                
                FitnessProfileButton(title: "Terms of Service", image: "info.circle"){
                    
                }
                
               
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.gray.opacity(0.3))
            )
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .onAppear {
            selectedImage = profileImage
        }
    }
}

#Preview {
    ProfileView()
}
