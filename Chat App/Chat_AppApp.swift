//
//  Chat_AppApp.swift
//  Chat App
//
//  Created by ashutosh on 20/07/21.
//

import SwiftUI
import Firebase
@main
struct Chat_AppApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @ObservedObject var currentUser = UserModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if isLoggedIn{
                HomeScreenView().environmentObject(currentUser)
            }else{
                LoginScreenView().environmentObject(currentUser)
            }
        }
    }
}
