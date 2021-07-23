//
//  SiginInScreenView.swift
//  Chat App
//
//  Created by ashutosh on 21/07/21.
//

import SwiftUI

struct SiginInScreenView: View {
    var body: some View {
        BackgroundView(text: "")
        .overlay(
            ZStack{
                SignInView()
            }
        )
    }
}

struct SignInView : View{
    @State var phoneNumber = ""
    @State var goToVerificationScreen = false
    var body : some View{
        ZStack{
            Color.white
            VStack(alignment:.leading,spacing:Screen.maxWidth*0.05){
                HStack{
                    Text("Enter your\nmobile number").font(.custom("Verdana", size: 25))
                    Spacer()
                }
                Text("We will send you confirmation code").foregroundColor(.gray).opacity(0.7)
                HStack{
                    Text("+91").font(.custom("Verdana", size: 25)).foregroundColor(.gray).opacity(0.7)
                   TextField("1234567890", text: $phoneNumber).font(.custom("Verdana", size: 25)).foregroundColor(.black)
                }.padding(.leading).padding(.trailing)
                .frame(width: Screen.maxWidth*0.9, height: Screen.maxHeight*0.05, alignment: .center)
                HStack{
                    Spacer()
                    VStack(spacing:0){
                        Spacer()
                    ForEach(0..<3){val in
                        HStack{
                            ForEach(0..<3){v in
                                Spacer()
                                ZStack{
                                    Text("\(v + 3*val + 1)").font(.custom("Verdana", size: 25))
                                  
                                }.frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center)
                                .onTapGesture {
                                    if self.phoneNumber.count<10{
                                    self.phoneNumber+="\(v + 3*val + 1)"
                                    }
                                    print(phoneNumber)
                                }
                                Spacer()
                            }
                        }
                    }
                    HStack{
                        Spacer()
                        ZStack{
                        //    Text("")
                        }.frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center)
                       Spacer()
                        Spacer()
                        ZStack{
                            Text("0").font(.custom("Verdana", size: 25))
                        }.frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center)
                        .onTapGesture {
                            if self.phoneNumber.count<10{
                            self.phoneNumber+="0"
                            }
                            print(phoneNumber)
                        }
                        Spacer()
                        Spacer()
                        ZStack{
                            Image(systemName: "arrow.backward.circle")
                                .font(.custom("Verdana", size: 25))
                                .foregroundColor(.green)
                        }.frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center)
                        .onTapGesture {
                            if !phoneNumber.isEmpty{
                            phoneNumber.remove(at: phoneNumber.index(before: phoneNumber.endIndex))
                            }
                            print(phoneNumber)
                        }
                        Spacer()
                    }
                        Spacer()
                    }.frame(width: Screen.maxWidth*0.9, height: Screen.maxWidth*0.9, alignment: .center)
                }
                NavigationLink(
                    destination: PhoneVerificationView(),
                    isActive : $goToVerificationScreen,
                    label: {
                        Button(action: {
                           self.goToVerificationScreen=true
                            
                        }, label: {
                            ZStack{
                            RoundedRectangle(cornerRadius: Screen.maxWidth*0.03)
                                .foregroundColor(.green)
                                Text("Next").foregroundColor(.white)
                            }.opacity(self.phoneNumber.count==10 ? 1 : 0.5)
                            
                        }).frame(width: Screen.maxWidth*0.9, height: Screen.maxHeight*0.06, alignment: .center)
                    })
               
                
                Spacer()
            }.padding(.all)
        }.frame(width: Screen.maxWidth*0.99, height: Screen.maxHeight*0.8, alignment: .center)
        .cornerRadius(Screen.maxWidth*0.05)
        .offset(y: Screen.maxHeight*0.1)
        .navigationBarHidden(true)
       
    }
}

struct SiginInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SiginInScreenView()
    }
}
