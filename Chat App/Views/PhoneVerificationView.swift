//
//  PhoneVerificationView.swift
//  Chat App
//
//  Created by ashutosh on 21/07/21.
//

import SwiftUI

struct PhoneVerificationView: View {
    var body: some View {
        BackgroundView(text: "")
        .overlay(
            ZStack{
                VerificationView()
            }
        )
    }
}

struct VerificationView : View{
    @State var verificationCode = ""
    @State var goToHomeScreen = false
    var body : some View{
        ZStack{
            Color.white
            VStack(alignment:.leading,spacing:Screen.maxWidth*0.05){
                HStack{
                    Text("Enter code sent\nto your phone").font(.custom("Verdana", size: 25))
                    Spacer()
                }
                Text("We have sent code to number \(Text("+91 12******90").foregroundColor(.green).bold().font(.custom("Verdana", size: 15)))").foregroundColor(.gray).opacity(0.7)
                HStack{
                    if verificationCode.count>=1{
                        Circle()
                            .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(.green)
                    }else{
                        
                        Circle()
                            .stroke(Color.green,lineWidth: 2)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
                    if verificationCode.count>=2{
                        Circle()
                            .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(.green)
                    }else{
                       
                        Circle()
                            .stroke(Color.green,lineWidth: 2)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
                    if verificationCode.count>=3{
                        Circle()
                            .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(.green)
                   
                    }else{
                        Circle()
                            .stroke(Color.green,lineWidth: 2)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
                    if verificationCode.count==4{
                        Circle()
                            .frame(width: 10, height: 10, alignment: .center)
                            .foregroundColor(.green)
                    }else{
                       
                        Circle()
                            .stroke(Color.green,lineWidth: 2)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
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
                                    if self.verificationCode.count<4{
                                    self.verificationCode+="\(v + 3*val + 1)"
                                    }
                                    print(verificationCode)
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
                            if self.verificationCode.count<4{
                            self.verificationCode+="0"
                            }
                            print(verificationCode)
                        }
                        Spacer()
                        Spacer()
                        ZStack{
                            Image(systemName: "arrow.backward.circle")
                                .font(.custom("Verdana", size: 25))
                                .foregroundColor(.green)
                        }.frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: .center)
                        .onTapGesture {
                            if !verificationCode.isEmpty{
                            verificationCode.remove(at: verificationCode.index(before: verificationCode.endIndex))
                            }
                            print(verificationCode)
                        }
                        Spacer()
                    }
                        Spacer()
                    }.frame(width: Screen.maxWidth*0.9, height: Screen.maxWidth*0.9, alignment: .center)
                }
                NavigationLink(
                    destination: HomeScreenView(),
                    isActive : $goToHomeScreen,
                    label: {
                        Button(action: {
                           self.goToHomeScreen=true
                            
                        }, label: {
                            ZStack{
                            RoundedRectangle(cornerRadius: Screen.maxWidth*0.03)
                                .foregroundColor(.green)
                                Text("Enter").foregroundColor(.white)
                            }.opacity(self.verificationCode.count==4 ? 1 : 0.5)
                            
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


struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView()
    }
}
