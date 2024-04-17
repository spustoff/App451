//
//  LoadingView.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            ProgressView()
                .offset(y: 130)
        }
    }
}

#Preview {
    LoadingView()
}
