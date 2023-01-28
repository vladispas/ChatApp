//
//  RootView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    var body: some View {
        
        VStack {
            
            Text("Hello, world!")
                .padding()
                .font(Font.chatHeading)
            
            Spacer()
            
            TabBar(selectedTab: $selectedTab)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
