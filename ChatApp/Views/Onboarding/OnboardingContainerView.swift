//
//  OnboardingContainerView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

enum OnboardingStep: Int {
    
    case welcome = 0
    case phoneNumber = 1
    case verification = 2
    case profile = 3
    case contacts = 4
}

struct OnboardingContainerView: View {
    
    @Binding var isOnboarding: Bool
    
    @State var currentStep: OnboardingStep = .welcome
    
    var body: some View {
        
        ZStack {
            
            Color("background")
                .ignoresSafeArea(edges: [.top, .bottom])
            
            switch currentStep {
            case .welcome:
                OnboardingWelcomeView(currentStep: $currentStep)
                
            case .phoneNumber:
                OnboardingPhoneNumberView(currentStep: $currentStep)
                
            case .verification:
                OnboardingVerificationView(currentStep: $currentStep)
                
            case .profile:
                OnboardingProfileView(currentStep: $currentStep)
                
            case .contacts:
                OnboardingContactsView(isOnboarding: $isOnboarding)
                
                
            }
        }
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView(isOnboarding: .constant(true))
    }
}
