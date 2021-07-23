//
//  LoginScreenView.swift
//  Chat App
//
//  Created by ashutosh on 21/07/21.
//

import SwiftUI

struct LoginScreenView: View {
    @EnvironmentObject var currentUser : UserModel
    @State var goToSignInScreen = false
    var body: some View {
        NavigationView{
        ZStack{
            if !goToSignInScreen{
            BackgroundView(text: "Connect to\nfamily & friends")
                .overlay(
                    ZStack{
                            LoginView(goToSignInScreen : $goToSignInScreen)
                    }
                    .cornerRadius(Screen.maxWidth*0.05)
                    .offset( y: Screen.maxHeight*0.25)
                )
            }else{
                SiginInScreenView()
            }
        }
        }.navigationBarHidden(true)
        .overlay(LoadingScreen().opacity(currentUser.isLoading ? 1 : 0))
    }
}

struct BackgroundView : View{
    var text : String
    var body : some View{
        VStack{
        ZStack{
            VStack{
                ZStack{
            HStack{
                ZStack{
           Circle()
            .trim(from: 0.0, to: 0.25)
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.green,Color.white]), startPoint: .top, endPoint: .bottom),lineWidth:Screen.maxWidth*0.1)
            .rotationEffect(.degrees(-90))
            .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
           // .opacity(0.1)
                    Circle()
                     .trim(from: 0.0, to: 0.25)
                     .stroke(Color.green,lineWidth:Screen.maxWidth*0.03)
                     .rotationEffect(.degrees(-90))
                     .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
                        .offset(x:15)
                }
                ZStack{
                Circle()
                    .trim(from: -0.1, to: 0.25)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.green,Color.white]), startPoint: .topLeading, endPoint: .bottomLeading),lineWidth:Screen.maxWidth*0.1)
                 .rotationEffect(.degrees(90))
                 .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
                .opacity(0.5)
                }.offset(x:-7.5)
                
            }.offset(x:Screen.maxWidth*0.1,y:-Screen.maxHeight*0.02)
                    HStack{
                        ZStack{
                   Circle()
                    .trim(from: 0.0, to: 0.25)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.green,Color.white]), startPoint: .top, endPoint: .bottom),lineWidth:Screen.maxWidth*0.1)
                    .rotationEffect(.degrees(-90))
                    .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                      
                        ZStack{
                        Circle()
                            .trim(from: -0.1, to: 0.25)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.green,Color.white]), startPoint: .topLeading, endPoint: .bottomLeading),lineWidth:Screen.maxWidth*0.1)
                         .rotationEffect(.degrees(90))
                         .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
                        .opacity(0.5)
                        }.offset(x:-7.5)
                    }.rotationEffect(.degrees(50))
                    .offset(x:-Screen.maxWidth*0.5)
                    
                    Text(text).font(.custom("Verdana", size: 35)).padding(.trailing,Screen.maxWidth*0.25)
            }
                ZStack{
           Circle()
            .trim(from: 0, to: 0.3)
            .stroke(LinearGradient(gradient: Gradient(colors: [Color.green,Color.white]), startPoint: .top, endPoint: .bottom),lineWidth:Screen.maxWidth*0.1)
            .rotationEffect(.degrees(-105))
            .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
                    Circle()
                     .trim(from: 0, to: 0.2)
                     .stroke(Color.green,lineWidth:Screen.maxWidth*0.03)
                     .rotationEffect(.degrees(-105))
                     .frame(width: Screen.maxWidth, height: Screen.maxWidth, alignment: .center)
                        .offset(y:-15)
                }
                .offset(x:-Screen.maxWidth*0.4,y:-Screen.maxHeight*0.09)
                
            }
            
        }
     
        Spacer()
        }
        .background(Color.green.opacity(0.15))
        .ignoresSafeArea()
        .navigationBarHidden(true)
      
    }
}

struct LoginView : View{
    @EnvironmentObject var currentUser : UserModel
    @State var loginEmail = ""
    @State var loginPassword = ""
    @Binding var goToSignInScreen : Bool
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some View{
        ZStack{
            Color.white
            VStack(alignment:.leading,spacing:Screen.maxWidth*0.04){
                Spacer()
        Text("Log In").font(.custom("verdana", size: 20))
            ZStack{
                RoundedRectangle(cornerRadius: Screen.maxWidth*0.03)
                    .stroke(Color.gray,lineWidth: 2)
                    .opacity(0.5)
                TextField("Email or phone number", text: $currentUser.email).padding(.leading).padding(.trailing)
            }.frame(width: Screen.maxWidth*0.9, height: Screen.maxHeight*0.06, alignment: .center)
            
            ZStack{
                RoundedRectangle(cornerRadius: Screen.maxWidth*0.03)
                    .stroke(Color.gray,lineWidth: 2)
                    .opacity(0.5)
                SecureField("password", text: $currentUser.password).padding(.leading).padding(.trailing)
            }.frame(width: Screen.maxWidth*0.9, height: Screen.maxHeight*0.06, alignment: .center)
                Button(action: {
                    self.currentUser.isLoading=true
                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                        self.currentUser.isLoading=false
                        self.isLoggedIn=true
                    }
//                    currentUser.logIn()
                }, label: {
                    ZStack{
                    RoundedRectangle(cornerRadius: Screen.maxWidth*0.03)
                        .foregroundColor(.green)
                        Text("Log in").foregroundColor(.white)
                    }
                }).frame(width: Screen.maxWidth*0.9, height: Screen.maxHeight*0.06, alignment: .center)
                Text("Forget password?").foregroundColor(.gray).font(.custom("Verdana", size: 15))
                Spacer()
                HStack{
                    Spacer()
                    HStack{
                    Text("Dont have an account?").foregroundColor(.gray)
                    Text("sign up").foregroundColor(.green).bold()
                        .onTapGesture {
                            self.goToSignInScreen=true
                        }
                    }
                    Spacer()
                }
                Spacer()
            }.padding(.leading).padding(.trailing).padding(.top,Screen.maxHeight*0.03)
           
        }.frame(width: Screen.maxWidth*0.99, height: Screen.maxHeight*0.5, alignment: .center)
        .navigationBarHidden(true)
    }
}
struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
