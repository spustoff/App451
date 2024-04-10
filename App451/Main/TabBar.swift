//
//  TabBar.swift
//  App451
//
//  Created by Вячеслав on 4/10/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color("primary").opacity(0.4))
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color.blue: .gray)
                            .font(.system(size: 12, weight: .regular))
                            .opacity(0)
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Record = "Record"
    
    case Settings = "Settings"
}


#Preview {
    
    ContentView()
}
