//
//  ChatModel.swift
//  Chat App
//
//  Created by ashutosh on 22/07/21.
//

import SwiftUI

class ChatModel : Identifiable,ObservableObject{
    
  @Published var username : String
  @Published var phoneNumber : Int
  @Published var message : String
  @Published var isLiked : Bool = false
  @State var isReplying = false
    init(username:String,phoneNumber:Int,message:String,isLiked:Bool,isReplying:Bool=false) {
        self.username=username
        self.phoneNumber=phoneNumber
        self.message=message
        self.isLiked=isLiked
        self.isReplying=isReplying
    }
}
