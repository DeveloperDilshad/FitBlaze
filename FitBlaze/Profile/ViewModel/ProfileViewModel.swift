//
//  ProfileViewModel.swift
//  FitBlaze
//
//  Created by Dilshad P on 11/08/25.
//

import SwiftUI

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
    
    func openMailApp(){
        let emailSubject = "Fitblaze App - Contact Us"
        let recipientEmail = "support@fitblaze.com"
        
        let encodedSubject = emailSubject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedEmail = recipientEmail.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let urlString = "mailto:\(encodedEmail)?subject=\(encodedSubject)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }else {
            return
        }
    }
}
