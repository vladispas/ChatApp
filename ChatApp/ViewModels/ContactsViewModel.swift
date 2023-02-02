//
//  ContactsViewModel.swift
//  ChatApp
//
//  Created by Vlad Ispas on 29.01.2023.
//

import Foundation
import Contacts

class ContactsViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private var localContacts = [CNContact]()
    
    func getLocalContacts() {
        
        DispatchQueue.init(label: "getcontacts").async {
            do {
                
                let store = CNContactStore()
                
                let keys = [CNContactPhoneNumbersKey,
                            CNContactGivenNameKey,
                            CNContactFamilyNameKey] as [CNKeyDescriptor]
                
                let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                
                try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, success in
                    self.localContacts.append(contact)
                })
                
                DatabaseService().getPlatformUsers(localContacts: self.localContacts) { platformUsers in
                    DispatchQueue.main.async {
                        self.users = platformUsers
                    }
                }
            } catch {
                
            }
        }
    }
}
