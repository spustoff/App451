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
            
            Image("splash_bg")
                .resizable()
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            ProgressView()
                .offset(y: 130)
        }
    }
}

#Preview {
    LoadingView()
}
