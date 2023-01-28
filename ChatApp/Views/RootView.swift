//
//  RootView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .font(Font.title)
        }
        .padding()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
