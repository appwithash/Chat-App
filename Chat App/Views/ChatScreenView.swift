//
//  ChatScreenView.swift
//  Chat App
//
//  Created by ashutosh on 21/07/21.
//

import SwiftUI

struct ChatScreenView: View {
    @ObservedObject var chatPerson : MessageListModel
    @Environment(\.presentationMode) var presentationMode
    @State var newMessage : String = ""
  @State  var replyingMessage : String = "this is reply"
    @State var isReplying = false
    @State var username = ""
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            VStack{
            HStack{
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                    .padding(.leading)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
               
                chatPerson.profileImage
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: Screen.maxWidth*0.12, height: Screen.maxWidth*0.12, alignment: .center)
                    .padding(.leading)
                Text(chatPerson.username)
                    .bold()
                Spacer()
                Image(systemName: "phone")
                    .font(.system(size: 24))
                    .foregroundColor(.green)
                    .padding(.trailing)
                Image(systemName: "video")
                    .font(.system(size: 24))
                    .foregroundColor(.green)
                    .padding(.trailing)
            }
                Divider()
                Spacer()
                ScrollView(.vertical, showsIndicators: false) {
                    Spacer()
                    VStack{
                      
                        ForEach(self.chatPerson.chatMessagesList){message in
                            MessageCell(message: message, replyingMessage: $replyingMessage, isReplying: $isReplying,username : $username)
                        }
                    }
                }.padding(.leading).padding(.trailing)
               
                    HStack{
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                            .padding(.leading)
                        
                        ZStack{
                    RoundedRectangle(cornerRadius: Screen.maxWidth*0.1)
                        .stroke(Color.green)
                        .frame(width: Screen.maxWidth*0.65, height: Screen.maxHeight*0.055, alignment: .center)
                        .foregroundColor(.background)
                            HStack{
                                TextField("Type a message...", text: $newMessage).padding(.leading)
                                    .frame(width: Screen.maxWidth*0.55, height: Screen.maxHeight*0.055, alignment: .center)
                                Image(systemName: "paperplane.fill")
                                    .font(.system(size: 25))
                                    .foregroundColor(.green)
                                    .padding(.trailing)
                                    .onTapGesture {
                                        let newChatMessage = ChatModel(username: "ashutosh", phoneNumber: 1234567890, message: self.newMessage, isLiked: false)
                                        newChatMessage.isReplying=isReplying
                                        print(newChatMessage.isReplying)
                                        self.chatPerson.chatMessagesList.append(newChatMessage)
                                        newMessage=""
                                    }
                            }
                        }.overlay(
                            ReplyView(replyMessage: $replyingMessage, username: $username)
                                .opacity(self.isReplying ? 1 : 0)
                        )
                      
                        Image(systemName: "mic")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                        
                        Image(systemName: "camera")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                            .padding(.trailing)
                        
                    }
                    
             
            }
        }.navigationBarHidden(true)
        .onAppear{
            chatPerson.isMessageSeen=true
        }
    }
}

struct ReplyView : View{
    @Binding var replyMessage : String
    @Binding var username : String
     var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius : Screen.maxWidth*0.05)
                .stroke(Color.green)
            VStack{
            HStack{
            VStack(alignment:.leading){
                Text(username=="ashutosh" ? "You" : username).bold().foregroundColor(.green)
                Text(replyMessage).foregroundColor(.gray).opacity(0.5)
            }.padding(.leading)
              Spacer()
            }  .frame(width: Screen.maxWidth*0.65, height: Screen.maxHeight*0.055, alignment: .center)
            .background(Color.white)
            .cornerRadius(Screen.maxWidth*0.05)
            .padding(.top,1)
                Spacer()
            }
        }
        .frame(width: Screen.maxWidth*0.65, height: Screen.maxHeight*0.11, alignment: .center)
        .offset(y:-Screen.maxWidth*0.062)
    
    }
}

struct MessageCell :View{
    @ObservedObject var message : ChatModel
    @State private var offset = CGSize.zero
    @Binding var replyingMessage : String
    @Binding var isReplying : Bool
    @Binding var username : String
    var body: some View{
        ZStack{
          
            if message.isReplying{
                
        if(message.username=="ashutosh"){
            HStack{
                Spacer()
                Text(message.message+"replying").font(.custom("Verdana", size: 15))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(Screen.maxHeight*0.04)
                    .offset(x: offset.width , y: 0)
                    .animation(.easeInOut)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                withAnimation{
                                    if value.translation.width < 0 && value.translation.width > -Screen.maxWidth*0.5{
                                self.offset = value.translation
                                    }
                                }
                              
                            })
                            .onEnded({ (_) in
                                withAnimation{
                                self.offset = CGSize.zero
                                    message.isReplying=true
                                    self.isReplying=true
                                    self.username=message.username
                                }
                            })
                    )
            }.overlay(
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.green)
                }
            )
        }else{
            HStack{
            Text(message.message+"replying").font(.custom("Verdana", size: 15))
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(Screen.maxHeight*0.04)
                .offset(x:offset.width)
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            withAnimation{
                                if value.translation.width > 0 && value.translation.width<Screen.maxWidth*0.5{
                            self.offset = value.translation
                                 
                                }
                            }
                          
                        })
                        .onEnded({ (_) in
                            withAnimation{
                            self.offset = CGSize.zero
                                message.isReplying=true
                                self.isReplying=true
                                self.replyingMessage=message.message
                                self.username=message.username
                            }
                        })
                )
            Spacer()
            }
        }
        }else{
                if(message.username=="ashutosh"){
                    ZStack{
                       
                    HStack{
                        Spacer()
                        Text(message.message).font(.custom("Verdana", size: 15))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(Screen.maxHeight*0.04)
                            .offset(x: offset.width , y: 0)
                            .animation(.easeInOut)
                            .gesture(
                                DragGesture()
                                    .onChanged({ (value) in
                                        withAnimation{
                                            if value.translation.width < 0 && value.translation.width > -Screen.maxWidth*0.5{
                                        self.offset = value.translation
                                            }
                                        }
                                      
                                    })
                                    .onEnded({ (_) in
                                        withAnimation{
                                        self.offset = CGSize.zero
                                            message.isReplying=true
                                            self.isReplying=true
                                            self.replyingMessage=message.message
                                            self.username=message.username
                                        }
                                    })
                            )
                    }
                    }
                }else{
                    HStack{
                    Text(message.message).font(.custom("Verdana", size: 15))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(Screen.maxHeight*0.04)
                        .offset(x:offset.width)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    withAnimation{
                                        if value.translation.width > 0 && value.translation.width<Screen.maxWidth*0.5{
                                    self.offset = value.translation
                                          
                                        }
                                    }
                                  
                                })
                                .onEnded({ (_) in
                                    withAnimation{
                                    self.offset = CGSize.zero
                                        message.isReplying=true
                                        self.isReplying=true
                                        self.replyingMessage=message.message
                                        self.username=message.username
                                    }
                                })
                        )
                    Spacer()
                    }
                }
            }
        }
    }
}

struct ChatScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatScreenView(chatPerson: MessageListModel(username: "Natasha", profileImage: Image("profile1"), isStorySet: true, storyImage: Image("profile1"), lastSeen: 23,isMessageSeen:false, newMessageCount: 2, chatMessagesList: [ ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message1", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message2", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message3", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message4", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message5", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message6", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message7", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message8", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message9", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message10", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message11", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message13", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "ashutosh", phoneNumber: 1239312, message: "message14", isLiked: false),
                                                                                                                                                                                                                                         ChatModel(username: "natasha", phoneNumber: 1239312, message: "message15", isLiked: false),]))
        }
    }
}
