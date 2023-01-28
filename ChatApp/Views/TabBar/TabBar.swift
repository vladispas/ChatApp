//
//  TabBar.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

enum Tabs: Int {
    case chats = 0
    case contacts = 1
}

struct TabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {

        HStack(alignment: .center) {
            
            Button {
                
                selectedTab = .chats
            } label: {
                
                TabBarButton(buttonText: "Chats", buttonImage: "bubble.left", isActive: selectedTab == .chats)
            }
            .tint(Color("icons-secondary"))
            
            Button {
                
                // New Chat
            } label: {
                
                VStack(alignment: .center, spacing: 4) {
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("New Chat")
                        .font(Font.tabBar)
                }
            }
            .tint(Color("icons-primary"))
            
            Button {
                
                selectedTab = .contacts
            } label: {
                
                TabBarButton(buttonText: "Contacts", buttonImage: "person", isActive: selectedTab == .contacts)
            }
            .tint(Color("icons-secondary"))
        }
        .frame(height: 82)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.contacts))
    }
}
