//
//  ContentView.swift
//  Chat App
//
//  Created by ashutosh on 20/07/21.
//

import SwiftUI

struct HomeScreenView: View {
    @State var searchText = ""
    @State var goToSetting = false
    var body: some View {
        NavigationView{
      ZStack{
        Color.background.ignoresSafeArea()
            VStack(alignment:.leading,spacing:Screen.maxHeight*0.02){
                HStack{
                    ZStack{
                        Circle()
                            .stroke()
                            .frame(width: Screen.maxWidth*0.1, height: Screen.maxWidth*0.1, alignment: .center)
                    Image("profile2")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: Screen.maxWidth*0.1, height: Screen.maxWidth*0.1, alignment: .center)
                    }
                    Spacer()
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 25))
                    .foregroundColor(.green)
                    .padding(.trailing)
                }
                .padding(.leading).padding(.trailing)
                .onTapGesture {
                    self.goToSetting=true
                }
                
                ScrollView(.vertical, showsIndicators: false){
                 
                    VStack(alignment:.leading,spacing:Screen.maxHeight*0.02){
                        Text("Hi \(Text("Ashutosh") .font(.custom("Verdana", size: 25)).foregroundColor(.green))")
                .font(.custom("Verdana", size: 25)).padding(.leading)

                ZStack{
                    RoundedRectangle(cornerRadius: Screen.maxWidth*0.1)
                        .foregroundColor(.searchbar)
                    HStack{
                        ZStack{
                            VStack(spacing:0){
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 13, height: 13, alignment: .center)
                            .foregroundColor(.gray)
                            Capsule()
                                .frame(width:2, height: 8, alignment: .center)
                            }
                            .rotationEffect(.degrees(-40))
                            .foregroundColor(.gray)
                            .opacity(0.5)
                        }
                        TextField("Search", text: $searchText)
                    }.padding(.leading).padding(.trailing)
                }.frame(width: Screen.maxWidth*0.95, height: Screen.maxHeight*0.06, alignment: .center)
                .padding(.leading).padding(.trailing)
                Text("Status").font(.custom("Verdana", size: 15)).padding(.leading)
                StatusView().padding(.leading)
                Text("Messages").font(.custom("Verdana", size: 15)).padding(.leading)
                MessagesView()
                Spacer()
                }
            }
            }.navigationBarHidden(true)
        }
        }.navigationBarHidden(true)
    }
}

//MARK: - Stories Section
struct StatusView : View{
    var statusList : [StatusModel] = [
        StatusModel(username: "Natasha",profileImage:Image("profile1"), isStorySet:true, storyImage: Image("profile2")),
        StatusModel(username: "Rahul",profileImage:Image("profile7"), isStorySet:true, storyImage: Image("profile2")),
        StatusModel(username: "Sneha",profileImage:Image("profile8"), isStorySet:true, storyImage: Image("profile2")),
        StatusModel(username: "Steve",profileImage:Image("profile4"), isStorySet:true, storyImage: Image("profile2")),
        StatusModel(username: "Megha",profileImage:Image("profile5"), isStorySet:true, storyImage: Image("profile2")),
    ]
    var body : some View{
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing:Screen.maxWidth*0.04){
                VStack(spacing:3){
                    ZStack{
                        Circle()
                            .stroke(Color.green,lineWidth: 3)
                            .frame(width: Screen.maxWidth*0.18, height: Screen.maxWidth*0.18, alignment: .center)
                        Image("profile2")
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: Screen.maxWidth*0.15, height: Screen.maxWidth*0.15, alignment: .center)
                    }.padding(.top,2)
                    .overlay(
                        ZStack{
                        Circle()
                            .frame(width: Screen.maxWidth*0.05, height: Screen.maxWidth*0.05, alignment: .center)
                            .foregroundColor(.green)
                           
                            Image(systemName: "plus")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                        } .offset(x:Screen.maxWidth*0.054,y:Screen.maxWidth*0.054)
                    )
                    Text("Your story").font(.custom("Verdana", size: 10))
                }
                ForEach(statusList){story in
                    StatusCell(story: story)
                }
            }
        })
    }
}

struct StatusCell : View{
    let story : StatusModel
    var body : some View{
        VStack(spacing:3){
            ZStack{
                Circle()
                    .stroke(Color.green,lineWidth: 3)
                    .frame(width: Screen.maxWidth*0.18, height: Screen.maxWidth*0.18, alignment: .center)
                story.profileImage
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: Screen.maxWidth*0.15, height: Screen.maxWidth*0.15, alignment: .center)
            }.padding(.top,2)
            Text(story.username).font(.custom("Verdana", size: 10))
        }
    }
}

//MARK: - Messages Section
struct MessagesView : View{
    var messageContactList : [MessageListModel] = [
        MessageListModel(username: "Natasha", profileImage: Image("profile1"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:false, newMessageCount: 2, chatMessagesList: [ ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message1", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message2", isLiked: false, isReplying: false),
                                            ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message3", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message4", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message5", isLiked: false,isReplying: false),
                                            ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message6", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message7", isLiked: false,isReplying: false),
                                            ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message8", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message9", isLiked: false,isReplying: false),
                                            ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message10", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message11", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message13", isLiked: false,isReplying: false),
                                            ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message14", isLiked: false,isReplying: false),
                                            ChatModel(username: "natasha", phoneNumber: 1239312, message: "message15", isLiked: false,isReplying: false),]),
        MessageListModel(username: "Steve", profileImage: Image("profile4"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:true, newMessageCount: 2, chatMessagesList: []),
        MessageListModel(username: "Scarlette", profileImage: Image("profile3"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:true, newMessageCount: 2, chatMessagesList: []),
        MessageListModel(username: "Chandler", profileImage: Image("profile4"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:false, newMessageCount: 2, chatMessagesList: []),
        MessageListModel(username: "Rachel", profileImage: Image("profile5"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:false, newMessageCount: 2, chatMessagesList: []),
        MessageListModel(username: "Roy", profileImage: Image("profile6"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:true, newMessageCount: 2, chatMessagesList: []),
    ]
    @State var goToChatScreen = false
    var body: some View{
        VStack{
            ForEach(messageContactList){messageContact in
                        ChatContactCell(message: messageContact)
            }
            }
    }
}
struct ChatContactCell : View{
    @ObservedObject var message : MessageListModel
    @Environment(\.colorScheme) var colorScheme
    @State var gotoChatScreen=false
    var body: some View{
        NavigationLink(
            destination: ChatScreenView(chatPerson: message),
            isActive: $gotoChatScreen
            ) {
        HStack(spacing:Screen.maxWidth*0.04){
        ZStack{
            Circle()
                .stroke(Color.green,lineWidth: 3)
                .frame(width: Screen.maxWidth*0.18, height: Screen.maxWidth*0.18, alignment: .center)
            message.profileImage
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: Screen.maxWidth*0.15, height: Screen.maxWidth*0.15, alignment: .center)
                .overlay(
                    Circle()
                        .frame(width: Screen.maxWidth*0.03, height: Screen.maxWidth*0.03, alignment: .center)
                        .foregroundColor(.green)
                        .offset(x:Screen.maxWidth*0.05,y:Screen.maxWidth*0.05)
                )
           }.padding(.top,2)
            VStack(alignment:.leading,spacing:5){
                if message.isMessageSeen{
                                   HStack{
                                    Text(message.username).font(.custom("Verdana", fixedSize: 16))
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                       Spacer()
                                    Text("\(message.lastMessageAgo)min").foregroundColor(.gray).font(.custom("Verdana", fixedSize: 12))
                                   }
                                   Text(message.lastMessage).font(.custom("Verdana", fixedSize: 12))
                                    .foregroundColor(.gray)
                    }else{
                    HStack{
                                           Text(message.username).font(.custom("Verdana", fixedSize: 16)).bold()
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                           Spacer()
                                           Text("\(message.lastMessageAgo)min") .foregroundColor(colorScheme == .dark ? .white : .black).font(.custom("Verdana", fixedSize: 12)).bold()
                                       }
                                       HStack{
                                       Text(message.lastMessage)
                                        .font(.custom("Verdana", fixedSize: 12))
                                        .bold()
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        
                                           Spacer()
                                           ZStack{
                                               Circle()
                                                   .frame(width: Screen.maxWidth*0.06, height: Screen.maxWidth*0.06, alignment: .center)
                                                   .foregroundColor(.green)
                                              Text("\(message.newMessageCount)").font(.custom("Verdana", fixedSize: 16)).foregroundColor(.white)
                                           }
                        }
                }
        }
        }.padding(.leading).padding(.trailing).padding(.top,2)
        
        }.onAppear{
            for msg in message.chatMessagesList{
                message.lastMessage=msg.message
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
