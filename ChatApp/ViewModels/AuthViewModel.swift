//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Vlad Ispas on 28.01.2023.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    
    static func isUserSignedIn() -> Bool {
        
        return Auth.auth().currentUser != nil
    }
    
    static func getSignedInUserId() -> String {
        
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    static func signOut() {
        
        try? Auth.auth().signOut()
    }
}
