//
//  User.swift
//  Chat App
//
//  Created by ashutosh on 20/07/21.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth
class UserModel : Identifiable,ObservableObject{
    @Published var username = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var phoneNumber = ""
    @Published var email=""
    @Published var isLoading = false
    var storiesList : [StatusModel] = []
    
    func logIn(){
        self.isLoading=true
        
      
    

    }
}
