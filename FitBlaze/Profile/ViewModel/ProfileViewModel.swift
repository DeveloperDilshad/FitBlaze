//
//  ProfileViewModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 11/08/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published  var isEditImage: Bool = false
    @Published  var isEditName:Bool = false
    @Published  var currentName:String = ""
    @Published  var profileName:String = UserDefaults.standard.string(forKey: "profileName") ?? "Name"
    @Published  var profileImage:String = UserDefaults.standard.string(forKey: "profileImage") ?? "avatar"
    @Published  var selectedImage: String = UserDefaults.standard.string(forKey: "profileImage") ?? "avatar"
     var images = [
        "avatar","avatar-2","avatar-3","avatar-4","avatar-5","avatar-6","avatar-7", "avatar-8","avatar-9","avatar-10"
    ]
    
    func editImage() {
        isEditImage = true
        isEditName = false

    }
    
    func editName() {
        isEditImage = false
        isEditName = true
    }
    
    func setName(){
        UserDefaults.standard.set(currentName, forKey: "profileName")
        profileName = currentName
        self.dismiss()
    }
    func didSelectImage(_ image: String){
        selectedImage = image
        UserDefaults.standard.set(selectedImage, forKey: "profileImage")
    }
    
    func dismiss(){
        isEditImage = false
        isEditName = false
    }
    
    func setNewImage(){
        profileImage = selectedImage
        UserDefaults.standard.set(selectedImage, forKey: "profileImage")
        self.dismiss()
    }
}
