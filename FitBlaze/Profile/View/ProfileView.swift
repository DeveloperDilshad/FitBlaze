//
//  ProfileView.swift
//  FitBlaze
//
//  Created by Dilshad P on 03/08/25.
//

import SwiftUI

struct ProfileView: View {
    
@StateObject private var viewModel = ProfileViewModel()
   
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(viewModel.selectedImage)
                    .resizable()
                    .frame(width: 100, height: 64)
                    .padding(.all,8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.gray.opacity(0.3))
                    )
                    .onTapGesture {
                        withAnimation {
                            viewModel.editImage()
                        }
                    }
                VStack(alignment: .leading) {
                    Text("Good Morining")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                    
                    Text(viewModel.profileName)
                        .font(.title)
                }
                
            }
            
            if viewModel.isEditName {
                TextField("Name.....", text: $viewModel.currentName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .frame(width: .infinity,height: 50)
                    )
                   
                
                HStack {
                    FitnessProfileItemButton(title: "Cancel", backgroundColor: .gray.opacity(0.1)) {
                        withAnimation {
                            viewModel.dismiss()
                        }
                    }

                    FitnessProfileItemButton(title: "Done", backgroundColor: .black) {
                        withAnimation {
                            viewModel.setName()
                        }
                    }

                }
            }
            
            if viewModel.isEditImage {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.images,id: \.self) { image in
                            Button {
                                withAnimation {
                                    viewModel.didSelectImage(image)
                                }
                            } label: {
                                VStack {
                                    Image(image)
                                        .resizable()
                                        .frame(width: 100, height: 64)
                                        
                                    if viewModel.selectedImage == image {
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
                
                FitnessProfileItemButton(title: "Done", backgroundColor: .black) {
                    withAnimation {
                        viewModel.setNewImage()
                    }
                }
                
              

            }
            
            VStack {
                FitnessProfileButton(title: "Edit Name", image: "pencil"){
                    withAnimation {
                        viewModel.editName()
                    }
                }
                

                FitnessProfileButton(title: "Edit Image", image: "pencil"){
                    withAnimation {
                        viewModel.editImage()

                    }                }
                
               
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
    }
}

#Preview {
    ProfileView()
}
