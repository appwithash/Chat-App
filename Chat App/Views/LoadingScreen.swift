//
//  LoadingScreen.swift
//  Chat App
//
//  Created by ashutosh on 21/07/21.
//

import SwiftUI

struct LoadingScreen: View {
    @State var isAnimating = false
    @State var toValue : CGFloat = 0.1
    @State var fromValue : CGFloat = 0.1
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
                .opacity(0.1)
            ZStack{
            Circle()
                .stroke(Color.white,lineWidth: 5)
                .frame(width: Screen.maxWidth*0.13, height: Screen.maxWidth*0.13, alignment: .center)
                Circle()
                    .trim(from: 0, to:  0.25)
                 
                    .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.green)
                    .frame(width: Screen.maxWidth*0.13, height: Screen.maxWidth*0.13, alignment: .center)
                    .rotationEffect(.degrees(-90))
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(Animation.default.repeatForever(autoreverses: false).speed(0.5))
                    
            }
        }.onAppear{
            withAnimation{
            self.isAnimating=true
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
