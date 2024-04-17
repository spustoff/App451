//
//  Reviewers_1.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            Image("reviewers_1")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                
                Text("Cost control in one application")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: {
                    
                    Reviewers_2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
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
    Reviewers_1()
}
