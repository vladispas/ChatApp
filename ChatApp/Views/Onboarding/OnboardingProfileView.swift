//
//  OnboardingProfileView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct OnboardingProfileView: View {

    @Binding var currentStep: OnboardingStep
    
    @State var firstName = ""
    @State var lastName = ""
    
    var body: some View {

        VStack {
            
            Text("Setup your profile")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Just a few more detailes to get started.")
                .font(Font.bodyParagraph)
                .padding(.top, 12)
            
            Spacer()
            
            Button {
                // Show action sheet
            } label: {
                
                ZStack {
                    
                    Circle()
                        .foregroundColor(Color.white)
                    
                    Circle()
                        .stroke(Color("create-profile-image"), lineWidth: 2)
                    
                    Image(systemName: "camera.fill")
                        .tint(Color("icons-input"))
                }
                .frame(width: 134, height: 134)
            }

            
            Spacer()
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(CreateProfileTextFieldStyle())
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextFieldStyle())

            
            Spacer()

            Button {
                
                currentStep = .contacts
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
        }
        .padding(.horizontal)
    }
}

struct OnboardingProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingProfileView(currentStep: .constant(.profile))
    }
}
