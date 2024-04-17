//
//  Users_1.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            Image("users_1")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                
                Text("Show your financial\ngrowth")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: {
                    
                    Users_2(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue))
                })
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.ignoresSafeArea())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    Users_1(telegram: URL(string: "f")!, isTelegram: false)
}
