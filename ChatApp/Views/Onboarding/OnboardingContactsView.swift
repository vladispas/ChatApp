//
//  OnboardingContactsView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct OnboardingContactsView: View {

    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    @Binding var isOnboarding: Bool
    
    var body: some View {

        VStack {
            
            Spacer()
            
            Image("onboarding-all-set")
            
            Text("Awesome!")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("Continue to start chatting with your friends.")
                .font(Font.bodyParagraph)
                .padding(.top, 8)
            
            Spacer()
            
            Button {

                isOnboarding = false
            } label: {
                
                Text("Continue")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
        }
        .padding(.horizontal)
        .onAppear {
            
            contactsViewModel.getLocalContacts()
        }
    }
}

struct OnboardingContactsView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContactsView(isOnboarding: .constant(true))
    }
}
