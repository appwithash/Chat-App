//
//  MessagesListModel.swift
//  Chat App
//
//  Created by ashutosh on 20/07/21.
//

import SwiftUI

class MessageListModel : Identifiable, ObservableObject{
    @Published var username : String
    @Published var profileImage : Image
    @Published var isStorySet : Bool
    @Published var storyImage : Image
    @Published var lastMessage : String = "Tap to chat"
    @Published var lastMessageAgo : Int
    @Published var isMessageSeen : Bool = false
    @Published var newMessageCount : Int = 0
    @Published var chatMessagesList :[ChatModel] = [
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message1", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message2", isLiked: false),
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message3", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message4", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message5", isLiked: false),
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message6", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message7", isLiked: false),
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message8", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message9", isLiked: false),
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message10", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message11", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message13", isLiked: false),
//        ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message14", isLiked: false),
//        ChatModel(username: "natasha", phoneNumber: 1239312, message: "message15", isLiked: false),
    ]
    init(username : String, profileImage : Image=Image(systemName: "person"),isStorySet : Bool=true,storyImage : Image,lastSeen : Int,isMessageSeen:Bool,newMessageCount : Int,chatMessagesList:[ChatModel]) {
        self.username=username
        self.profileImage=profileImage
        self.isStorySet=isStorySet
        self.storyImage=storyImage
        self.lastMessageAgo = lastSeen
        self.isMessageSeen=isMessageSeen
        self.newMessageCount=newMessageCount
        self.chatMessagesList=chatMessagesList
    }
}
