//
//  StoryModel.swift
//  Chat App
//
//  Created by ashutosh on 20/07/21.
//

import SwiftUI

class StatusModel : Identifiable,ObservableObject{
    @Published var username : String
    @Published var profileImage : Image
    @Published var isStorySet : Bool
    @Published var storyImage : Image
    init(username : String, profileImage : Image=Image(systemName: "person"),isStorySet : Bool=true,storyImage : Image) {
        self.username=username
        self.profileImage=profileImage
        self.isStorySet=isStorySet
        self.storyImage=storyImage
    }
}
