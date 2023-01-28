//
//  TabBarButton.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var buttonImage: String
    var isActive: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            
            if isActive {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: geo.size.width / 2, height: 4)
                    .padding(.leading, geo.size.width / 4)
            }
            
            VStack(alignment: .center, spacing: 4) {
                
                Image(systemName: buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(buttonText)
                    .font(Font.tabBar)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(buttonText: "Chats", buttonImage: "bubble.left", isActive: true)
    }
}
