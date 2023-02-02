//
//  DatabaseService.swift
//  ChatApp
//
//  Created by Vlad Ispas on 02.02.2023.
//

import Foundation
import Contacts
import Firebase

class DatabaseService {
    
    func getPlatformUsers(localContacts: [CNContact], completion: @escaping ([User]) -> Void) {
        
        var platformUsers = [User]()
        
        var lookupPhoneNumbers = localContacts.map { contact in
            return TextHelper.sanitizePhoneNumber(contact.phoneNumbers.first?.value.stringValue ?? "")
        }
        
        guard lookupPhoneNumbers.count > 0 else {
            
            completion(platformUsers)
            
            return
        }
        
        let database = Firestore.firestore()
        
        while !lookupPhoneNumbers.isEmpty {
            
            let tenPhoneNumbers = Array(lookupPhoneNumbers.prefix(10))
            
            lookupPhoneNumbers = Array(lookupPhoneNumbers.dropFirst(10))
            
            let query = database.collection("users").whereField("phone", in: tenPhoneNumbers)

            query.getDocuments { snapshot, error in
                if error == nil && snapshot != nil {
                    
                    for doc in snapshot!.documents {
                        
                        if let user = try? doc.data(as: User.self) {
                            
                            platformUsers.append(user)
                        }
                    }
                    
                    if lookupPhoneNumbers.isEmpty {
                        
                        completion(platformUsers)
                    }
                }
            }
        }
    }
}
