//
//  User.swift
//  ChatApp
//
//  Created by Vlad Ispas on 02.02.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    
    @DocumentID var id: String?
    var firstname: String?
    var lastname: String?
    var phone: String?
    var photo: String?
}
