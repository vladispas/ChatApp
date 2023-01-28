//
//  OnboardingPhoneNumberView.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import SwiftUI

struct OnboardingPhoneNumberView: View {

    @Binding var currentStep: OnboardingStep
    
    @State var phoneNumber = ""

    var body: some View {

        VStack {
            
            Text("Verification")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Enter your mobile phone number below. We'll send you a verification code after.")
                .font(Font.bodyParagraph)
                .padding(.top, 12)
            
            ZStack {
                
                Rectangle()
                    .frame(height: 56)
                    .foregroundColor(Color("input"))
                
                HStack {
                    TextField("e.g. +1 613 515 0123", text: $phoneNumber)
                        .font(Font.bodyParagraph)
                    
                    Spacer()
                    
                    Button {
                        
                        phoneNumber = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            
                    }
                    .frame(width: 19, height: 19)
                    .tint(Color("icons-input"))
                }
                .padding()
            }
            .padding(.top, 34)
            
            Spacer()
            
            Button {
                
                currentStep = .verification
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
        }
        .padding(.horizontal)
    }
}

struct OnboardingPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPhoneNumberView(currentStep: .constant(.phoneNumber))
    }
}
