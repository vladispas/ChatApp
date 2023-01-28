//
//  OnboardingWelcomeView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct OnboardingWelcomeView: View {

    @Binding var currentStep: OnboardingStep
        
    var body: some View {

        VStack {
            
            Spacer()
            
            Image("onboarding-welcome")
            
            Text("Welcome to Chat App")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("Simple and fuss-free chat experience")
                .font(Font.bodyParagraph)
                .padding(.top, 8)
            
            Spacer()
            
            Button {

                currentStep = .phoneNumber
            } label: {
                
                Text("Get Started")
            }
            .buttonStyle(OnboardingButtonStyle())

            Text("By tapping 'Get Started', you agree to our Privacy Policy.")
                .font(Font.smallText)
                .padding(.top, 14)
                .padding(.bottom, 61)
        }
        .padding(.horizontal)
    }
}

struct OnboardingWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingWelcomeView(currentStep: .constant(.welcome))
    }
}
